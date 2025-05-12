import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription_isar.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../features/my_subscriptions/domain/model/subscriptionCategory/subscription_category_isar.dart';

class IsarService {
  static late Isar isar;

  static init() async {
    final dir = await getApplicationDocumentsDirectory();

    final isar = await Isar.open(
      [
        SubscriptionIsarSchema,
        SubscriptionCategoryIsarSchema,
      ], // Add other schemas too
      directory: dir.path,
    );
  }
}
