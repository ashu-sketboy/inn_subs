part of 'my_subs_bloc.dart';

@freezed
class MySubsState with _$MySubsState {
  const factory MySubsState({
    required MySubscriptionRepository repo,
    ListenableStatus? listenStatus,
    @Default(0) int currentSelectedCategory,
    @Default(ScreenStatus.initial()) ScreenStatus status,
    @Default([]) List<SubscriptionCategory> subscriptionCategory,
    @Default([]) List<Subscription> mySubscriptions,
  }) = _MySubsState;
}
