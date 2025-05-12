import 'package:freezed_annotation/freezed_annotation.dart';

part 'listenable_status.freezed.dart';

@freezed
sealed class ListenableStatus with _$ListenableStatus {
  const factory ListenableStatus.success(String title, String message) =
      ListenSuccess;
  const factory ListenableStatus.error(String title, String message) =
      ListenError;
}
