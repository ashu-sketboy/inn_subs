import 'package:inn_subs/features/my_subscriptions/data/subscriptions_data.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';

class MySubscriptionRepository {
  late final SubscriptionData _data;
  MySubscriptionRepository() {
    _data = SubscriptionData();
  }

  List<Subscription> getAllSubscriptions() {
    return _data.getAllSubs();
  }

  List<Subscription> getMySubscriptions() {
    return _data.getAllSubs();
  }

  List<SubscriptionCategory> getAllCategories() {
    return [];
  }
}
