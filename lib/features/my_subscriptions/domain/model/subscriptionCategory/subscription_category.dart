import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';

part 'subscription_category.freezed.dart';
part 'subscription_category.g.dart';

SubscriptionCategory subscriptionCategoryFromJson(String str) =>
    SubscriptionCategory.fromJson(json.decode(str));

String subscriptionCategoryToJson(SubscriptionCategory data) =>
    json.encode(data.toJson());

@freezed
class SubscriptionCategory with _$SubscriptionCategory {
  const factory SubscriptionCategory({required int id, required String name}) =
      _SubscriptionCategory;

  factory SubscriptionCategory.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionCategoryFromJson(json);
}
