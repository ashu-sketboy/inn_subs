import 'package:inn_subs/features/my_subscriptions/data/subscriptions_data.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';

class MySubscriptionRepository {
  late final SubscriptionData _data;
  MySubscriptionRepository() {
    _data = SubscriptionData();
  }

  Future<List<Subscription>> getMySubscriptions() async {
    return _data.getMySubs();
  }

  Future<List<SubscriptionCategory>> getAllCategories() async {
    return _data.getSubsCategory();
  }
}
