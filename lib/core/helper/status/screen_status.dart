import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_status.freezed.dart';

@freezed
sealed class ScreenStatus with _$ScreenStatus {
  const factory ScreenStatus.initial() = InitialState;
  const factory ScreenStatus.loading() = LoadingState;
  const factory ScreenStatus.success(String message) = SuccessState;
  const factory ScreenStatus.error(String message) = ErrorState;
}
