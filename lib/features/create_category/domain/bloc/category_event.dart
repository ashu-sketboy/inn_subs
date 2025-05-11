part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.loadAllSubscription() = _LoadAllSubscription;
  const factory CategoryEvent.createNewCategory() = _CreateNewCategory;
  const factory CategoryEvent.addRemoveSubs({required int idx}) =
      _AddRemoveSubs;
}
