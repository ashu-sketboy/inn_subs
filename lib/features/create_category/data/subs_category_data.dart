import 'package:inn_subs/core/constants.dart';
import 'package:inn_subs/core/helper/isar_service/isar_service.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription_isar.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category_isar.dart';
import 'package:isar/isar.dart';

class SubsCategoryData {
  List<Subscription> getAllSubs() {
    return kAllSubs;
  }

  void createCategory(
    SubscriptionCategory category,
    List<Subscription> subscription,
  ) async {
    Isar isar = IsarService.isar;

    SubscriptionCategoryIsar newCategoryIsar =
        SubscriptionCategoryIsar.fromDomain(category);
    int response = await isar.subscriptionCategoryIsars.put(newCategoryIsar);

    List<SubscriptionIsar> subsIsar =
        subscription.map((e) => SubscriptionIsar.fromDomain(e)).toList();
    List<int> subsResponse = await isar.subscriptionIsars.putAll(subsIsar);
  }
}
