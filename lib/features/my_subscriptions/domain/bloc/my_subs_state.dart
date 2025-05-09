part of 'my_subs_bloc.dart';

@freezed
class MySubsState with _$MySubsState {
  const factory MySubsState({
    required MySubscriptionRepository repo,
    @Default(0) int currentSelectedCategory,
    @Default(ScreenStatus.initial()) ScreenStatus status,
    @Default([]) List<SubscriptionCategory> subscriptionCategory,
    @Default([]) List<Subscription> subscription,
    @Default([
      0xFFFFBF00,
      0xFFFFC0CB,
      0xFF00FFFF,
      0xFF36013F,
      0xFFFFA500,
      0xFF673AB7,
    ])
    List<int> color,
  }) = _MySubsState;
}
