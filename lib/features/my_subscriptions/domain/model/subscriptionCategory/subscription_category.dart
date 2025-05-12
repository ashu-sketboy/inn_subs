import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_category.freezed.dart';

@freezed
class SubscriptionCategory with _$SubscriptionCategory {
  const factory SubscriptionCategory({required int id, required String name}) =
      _SubscriptionCategory;
}
