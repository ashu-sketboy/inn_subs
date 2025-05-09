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
        imagePath: "assets/icons/ai.png",
        textColor: 0xFF000000,
        bgColor: 0xFFFFBF00,
      ),
      Subscription(
        id: 1,
        name: "Dribbble",
        price: 4.99,
        period: "month",
        imagePath: "assets/icons/dribbble.png",
        textColor: 0xFFFFFFFF,
        bgColor: 0xFFFFC0CB,
      ),
      Subscription(
        id: 2,
        name: "Figma",
        price: 9.99,
        period: "month",
        imagePath: "assets/icons/figma.png",
        textColor: 0xFFFFFFFF,
        bgColor: 0xFF00FFFF,
      ),
      Subscription(
        id: 3,
        name: "LinkedIn",
        price: 9.99,
        period: "month",
        imagePath: "assets/icons/linkedin.png",
        textColor: 0xFFFFFFFF,
        bgColor: 0xFF36013F,
      ),
      Subscription(
        id: 4,
        name: "Medium",
        price: 1.99,
        period: "month",
        imagePath: "assets/icons/medium.png",
        textColor: 0xFFFFFFFF,
        bgColor: 0xFFFFA500,
      ),
      Subscription(
        id: 5,
        name: "Netflix",
        price: 9.99,
        period: "month",
        imagePath: "assets/icons/netflix.png",
        textColor: 0xFFFFFFFF,
        bgColor: 0xFF673AB7,
      ),
      Subscription(
        id: 6,
        name: "Amazon Prime",
        price: 3.99,
        period: "month",
        imagePath: "assets/icons/prime.png",
        textColor: 0xFF000000,
        bgColor: 0xFFFFBF00,
      ),
      Subscription(
        id: 7,
        name: "PhotoShop",
        price: 30.99,
        period: "month",
        imagePath: "assets/icons/ps.png",
        textColor: 0xFFFFFFFF,
        bgColor: 0xFFFFC0CB,
      ),
      Subscription(
        id: 8,
        name: "Spotify",
        price: 5.99,
        period: "month",
        imagePath: "assets/icons/spotify.png",
        textColor: 0xFFFFFFFF,
        bgColor: 0xFF00FFFF,
      ),
      Subscription(
        id: 9,
        name: "Youtube",
        price: 29.99,
        period: "month",
        imagePath: "assets/icons/youtube.png",
        textColor: 0xFFFFFFFF,
        bgColor: 0xFF36013F,
      ),
    ];
  }

  List<SubscriptionCategory> getAllCategories() {
    return [];
  }
}
