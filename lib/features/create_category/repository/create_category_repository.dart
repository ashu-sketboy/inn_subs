import 'package:inn_subs/features/create_category/data/subs_category_data.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';

class CreateCategoryRepository {
  late final SubsCategoryData _data;
  CreateCategoryRepository() {
    _data = SubsCategoryData();
  }

  List<Subscription> getAllSubscriptions() {
    return _data.getAllSubs();
  }

  void createCategory({
    required SubscriptionCategory category,
    required List<Subscription> subscription,
  }) {
    return _data.createCategory(category, subscription);
  }
}
