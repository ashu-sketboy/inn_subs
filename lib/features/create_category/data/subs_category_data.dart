import 'package:inn_subs/core/constants.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';

class SubsCategoryData {
  List<Subscription> getAllSubs() {
    return kAllSubs;
  }

  void createCategory(
    SubscriptionCategory category,
    List<Subscription> subscription,
  ) {
    // TODO: SAVE
  }
}
