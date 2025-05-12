import 'package:isar/isar.dart';

import 'subscription.dart'; // For mapping

part 'subscription_isar.g.dart';

@collection
class SubscriptionIsar {
  Id id = Isar.autoIncrement;

  late int parentId;
  late String name;
  late double price;
  late String period;
  late String imagePath;
  late int textColor;
  late int bgColor;

  // Convert to Freezed model
  Subscription toDomain() => Subscription(
    id: id,
    parentId: parentId,
    name: name,
    price: price,
    period: period,
    imagePath: imagePath,
    textColor: textColor,
    bgColor: bgColor,
  );

  // Create from Freezed model
  static SubscriptionIsar fromDomain(Subscription subscription) {
    final isarModel = SubscriptionIsar();
    isarModel.id = subscription.id;
    isarModel.parentId = subscription.parentId;
    isarModel.name = subscription.name;
    isarModel.price = subscription.price;
    isarModel.period = subscription.period;
    isarModel.imagePath = subscription.imagePath;
    isarModel.textColor = subscription.textColor;
    isarModel.bgColor = subscription.bgColor;
    return isarModel;
  }
}
