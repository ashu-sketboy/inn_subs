part of 'my_subs_bloc.dart';

@freezed
class MySubsEvent with _$MySubsEvent {
  const factory MySubsEvent.loadAllSubscription() = _LoadAllSubscription;
  const factory MySubsEvent.loadMyData() = _LoadMyData;
  const factory MySubsEvent.createNewCategory({required String categoryName}) =
      _CreateNewCategory;
  const factory MySubsEvent.addRemoveSubs({required int idx}) = _AddRemoveSubs;
  const factory MySubsEvent.selectCurrentCategory({required int categoryId}) =
      _SelectCurrentCategory;
}
