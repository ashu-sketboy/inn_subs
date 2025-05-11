import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inn_subs/core/helper/listenable_status.dart';
import 'package:inn_subs/core/helper/screen_status.dart';
import 'package:inn_subs/features/create_category/repository/create_category_repository.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final TextEditingController controller = TextEditingController();
  CategoryBloc({
    required List<Subscription> mySubscriptions,
    required List<SubscriptionCategory> category,
  }) : super(
         CategoryState(
           repo: CreateCategoryRepository(),
           mySubscriptions: mySubscriptions,
           category: category,
         ),
       ) {
    on<_LoadAllSubscription>((event, emit) {
      try {
        emit(
          state.copyWith(status: ScreenStatus.loading(), selectedSubsIndex: []),
        );

        List<Subscription> subsResponse = state.repo.getAllSubscriptions();

        for (Subscription subs in mySubscriptions) {
          subsResponse.removeWhere((e) => e.id == subs.id);
        }

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
    on<_CreateNewCategory>((event, emit) {
      try {
        SubscriptionCategory newCategory = SubscriptionCategory(
          id: DateTime.now().microsecondsSinceEpoch,
          name: controller.text,
        );

        if (state.selectedSubsIndex.isEmpty) {
          emit(
            state.copyWith(
              status: ScreenStatus.error("Select some subs for category."),
            ),
          );
          return;
        }

        for (SubscriptionCategory category in state.category) {
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
            status: ScreenStatus.success("New Category created"),
            category: [...state.category, newCategory],
            mySubscriptions: [...mySubs],
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(status: ScreenStatus.error("Something went wrong")),
        );
      }
    });
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
  }
}
