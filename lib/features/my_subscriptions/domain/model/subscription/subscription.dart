import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';

@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    @Default(0) int parentId,
    required int id,
    required String name,
    required double price,
    required String period,
    required String imagePath,
    required int textColor,
    required int bgColor,
  }) = _Subscription;
}
