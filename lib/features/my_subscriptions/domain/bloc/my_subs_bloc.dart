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
    on<_LoadSubs>((event, emit) {
      try {
        emit(state.copyWith(status: ScreenStatus.loading()));

        List<SubscriptionCategory> categoryResponse =
            state.repo.getAllCategories();
        List<Subscription> subsResponse = state.repo.getAllSubscriptions();

        emit(
          state.copyWith(
            status: ScreenStatus.success("D"),
            subscriptionCategory: categoryResponse,
            subscription: subsResponse,
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

        List<Subscription> subs = state.subscription;
        for (int idx in event.selectedSubsIndex) {
          subs[idx] = subs[idx].copyWith(parentId: newCategory.id);
        }

        emit(
          state.copyWith(
            status: ScreenStatus.initial(),
            currentSelectedCategory: newCategory.id,
            subscriptionCategory: [...state.subscriptionCategory, newCategory],
            subscription: [...state.subscription],
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
