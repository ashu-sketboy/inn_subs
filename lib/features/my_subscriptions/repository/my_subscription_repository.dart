import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';

class MySubscriptionRepository {
  List<Subscription> getAllSubscriptions() {
    return [
      Subscription(
        id: 0,
        name: "Adobe Illustrator",
        price: 100,
        period: "month",
        imagePath: "assets/images/ai.png",
      ),
      Subscription(
        id: 1,
        name: "Dribbble",
        price: 4.99,
        period: "month",
        imagePath: "assets/images/dribbble.png",
      ),
      Subscription(
        id: 2,
        name: "Figma",
        price: 9.99,
        period: "month",
        imagePath: "assets/images/figma.png",
      ),
      Subscription(
        id: 3,
        name: "LinkedIn",
        price: 9.99,
        period: "month",
        imagePath: "assets/images/linkedin.png",
      ),
      Subscription(
        id: 4,
        name: "Medium",
        price: 1.99,
        period: "month",
        imagePath: "assets/images/medium.png",
      ),
      Subscription(
        id: 5,
        name: "Netflix",
        price: 9.99,
        period: "month",
        imagePath: "assets/images/netflix.png",
      ),
      Subscription(
        id: 6,
        name: "Amazon Prime",
        price: 3.99,
        period: "month",
        imagePath: "assets/images/prime.png",
      ),
      Subscription(
        id: 7,
        name: "PhotoShop",
        price: 30.99,
        period: "month",
        imagePath: "assets/images/ps.png",
      ),
      Subscription(
        id: 8,
        name: "Spotify",
        price: 5.99,
        period: "month",
        imagePath: "assets/images/spotify.png",
      ),
      Subscription(
        id: 9,
        name: "Youtube",
        price: 29.99,
        period: "month",
        imagePath: "assets/images/youtube.png",
      ),
    ];
  }

  List<SubscriptionCategory> getAllCategories() {
    return [SubscriptionCategory(id: 0, name: "All Sabs")];
  }
}
