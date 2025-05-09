part of 'my_subs_bloc.dart';

@freezed
class MySubsEvent with _$MySubsEvent {
  const factory MySubsEvent.loadData() = _LoadSubs;
  const factory MySubsEvent.createNewCategory({
    required String categoryName,
    required List<int> selectedSubsIndex,
  }) = _CreateNewCategory;
  const factory MySubsEvent.selectCurrentCategory({required int categoryId}) =
      _SelectCurrentCategory;
}
