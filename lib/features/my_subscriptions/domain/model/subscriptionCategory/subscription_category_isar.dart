import 'package:isar/isar.dart';

import 'subscription_category.dart'; // for toDomain/fromDomain conversion

part 'subscription_category_isar.g.dart';

@collection
class SubscriptionCategoryIsar {
  Id id = Isar.autoIncrement; // Use Isar's ID auto-increment
  late String name;

  // Converts to Freezed model
  SubscriptionCategory toDomain() => SubscriptionCategory(id: id, name: name);

  // Converts from Freezed model
  static SubscriptionCategoryIsar fromDomain(SubscriptionCategory domain) {
    final isarCategory = SubscriptionCategoryIsar();
    isarCategory.id = domain.id;
    isarCategory.name = domain.name;
    return isarCategory;
  }
}
