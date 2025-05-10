import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inn_subs/core/helper/screen_status.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';
import 'package:inn_subs/features/my_subscriptions/repository/my_subscription_repository.dart';

part 'my_subs_bloc.freezed.dart';
part 'my_subs_event.dart';
part 'my_subs_state.dart';

class MySubsBloc extends Bloc<MySubsEvent, MySubsState> {
  MySubsBloc() : super(MySubsState(repo: MySubscriptionRepository())) {
    on<_AddRemoveSubs>((event, emit) {
      List<int> selectedSubs = [];
      bool existed = false;

      for (int i = 0; i < state.selectedSubsIndex.length; i++) {
        if (state.selectedSubsIndex[i] == event.idx) {
          existed = true;
        } else {
          selectedSubs.add(state.selectedSubsIndex[i]);
        }
      }

      if (!existed) {
        selectedSubs.add(event.idx);
      }

      emit(
        state.copyWith(
          status: ScreenStatus.initial(),
          selectedSubsIndex: selectedSubs,
        ),
      );
    });
    on<_LoadAllSubscription>((event, emit) {
      try {
        emit(
          state.copyWith(status: ScreenStatus.loading(), selectedSubsIndex: []),
        );

        List<Subscription> subsResponse = state.repo.getAllSubscriptions();

        emit(
          state.copyWith(
            status: ScreenStatus.success("All subs loaded"),
            allSubscriptions: subsResponse,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(status: ScreenStatus.error("Something went wrong")),
        );
      }
    });
    on<_LoadMyData>((event, emit) {
      try {
        emit(state.copyWith(status: ScreenStatus.loading()));

        List<SubscriptionCategory> categoryResponse =
            state.repo.getAllCategories();
        List<Subscription> subsResponse = state.repo.getMySubscriptions();

        emit(
          state.copyWith(
            status: ScreenStatus.success("D"),
            subscriptionCategory: categoryResponse,
            mySubscriptions: subsResponse,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(status: ScreenStatus.error("Something went wrong")),
        );
      }
    });
    on<_SelectCurrentCategory>((event, emit) {
      try {
        emit(
          state.copyWith(
            status: ScreenStatus.initial(),
            currentSelectedCategory: event.categoryId,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(status: ScreenStatus.error("Something went wrong")),
        );
      }
    });
    on<_CreateNewCategory>((event, emit) {
      try {
        SubscriptionCategory newCategory = SubscriptionCategory(
          id: DateTime.now().microsecondsSinceEpoch,
          name: event.categoryName,
        );

        if (state.selectedSubsIndex.isEmpty) {
          emit(
            state.copyWith(
              status: ScreenStatus.error("Select some subs for category."),
            ),
          );
          return;
        }

        for (SubscriptionCategory category in state.subscriptionCategory) {
          if (category.name == newCategory.name) {
            emit(
              state.copyWith(
                status: ScreenStatus.error(
                  "Category already exists, try with different name.",
                ),
              ),
            );
            return;
          }
        }

        List<Subscription> mySubs = state.mySubscriptions;

        for (int idx in state.selectedSubsIndex) {
          final Subscription subscription = state.allSubscriptions[idx]
              .copyWith(parentId: newCategory.id);
          mySubs.add(subscription);
        }

        emit(
          state.copyWith(
            status: ScreenStatus.initial(),
            currentSelectedCategory: newCategory.id,
            subscriptionCategory: [...state.subscriptionCategory, newCategory],
            mySubscriptions: [...mySubs],
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(status: ScreenStatus.error("Something went wrong")),
        );
      }
    });
  }
}
