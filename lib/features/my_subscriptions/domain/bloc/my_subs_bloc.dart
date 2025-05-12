import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inn_subs/core/helper/status/listenable_status.dart';
import 'package:inn_subs/core/helper/status/screen_status.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';
import 'package:inn_subs/features/my_subscriptions/repository/my_subscription_repository.dart';

part 'my_subs_bloc.freezed.dart';
part 'my_subs_event.dart';
part 'my_subs_state.dart';

class MySubsBloc extends Bloc<MySubsEvent, MySubsState> {
  MySubsBloc() : super(MySubsState(repo: MySubscriptionRepository())) {
    on<_LoadMyData>((event, emit) {
      try {
        emit(state.copyWith(status: ScreenStatus.loading()));

        List<SubscriptionCategory> categoryResponse =
            state.repo.getAllCategories();
        List<Subscription> subsResponse = state.repo.getMySubscriptions();

        emit(
          state.copyWith(
            status: ScreenStatus.success("Data Loaded"),
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
  }
}
