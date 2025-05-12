part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    required CreateCategoryRepository repo,
    required List<SubscriptionCategory> category,
    required List<Subscription> mySubscriptions,
    ListenableStatus? listenStatus,
    @Default(ScreenStatus.initial()) ScreenStatus status,
    @Default([]) List<Subscription> allSubscriptions,
    @Default([]) List<int> selectedSubsIndex,
  }) = _CategoryState;
}

const kCreateCategoryError = 'CATEGORY_ERROR';
const kCreateCategorySuccess = 'CATEGORY_SUCCESS';
