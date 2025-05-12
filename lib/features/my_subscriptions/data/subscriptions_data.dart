import 'package:inn_subs/core/helper/isar_service/isar_service.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription_isar.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category_isar.dart';
import 'package:isar/isar.dart';

class SubscriptionData {
  Future<List<Subscription>> getMySubs() async {
    Isar isar = IsarService.isar;

    List<SubscriptionIsar> response =
        await isar.subscriptionIsars.filter().parentIdGreaterThan(0).findAll();

    return response.map((e) => e.toDomain()).toList();
  }

  Future<List<SubscriptionCategory>> getSubsCategory() async {
    Isar isar = IsarService.isar;
    List<SubscriptionCategoryIsar> response =
        await isar.subscriptionCategoryIsars.where().findAll();
    return response.map((e) => e.toDomain()).toList();
  }
}
