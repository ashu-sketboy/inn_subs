part of 'my_subs_bloc.dart';

@freezed
class MySubsEvent with _$MySubsEvent {
  const factory MySubsEvent.loadMyData() = _LoadMyData;
  const factory MySubsEvent.selectCurrentCategory({required int categoryId}) =
      _SelectCurrentCategory;
}
