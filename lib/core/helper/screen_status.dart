import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_status.freezed.dart';

@freezed
sealed class ScreenStatus with _$ScreenStatus {
  const factory ScreenStatus.initial() = _Initial;
  const factory ScreenStatus.loading() = _Loading;
  const factory ScreenStatus.success(String message) = _Success;
  const factory ScreenStatus.error(String message) = _Error;
}
