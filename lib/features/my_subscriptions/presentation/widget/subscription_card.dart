import 'package:flutter/material.dart';
import 'package:inn_subs/core/widgets/circular_icon.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.subscription,
    required this.index,
  });

  final Subscription subscription;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: .8,
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(subscription.bgColor),
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: 2, blurRadius: 6),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subscription.name,
                    style: TextStyle(
                      color: Color(subscription.textColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subscription.id != -1) ...{
                    SizedBox(height: 10),
                    Chip(
                      label: Text(
                        "\$${subscription.price} / ${subscription.period}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  },
                ],
              ),
            ),
            if (subscription.id == -1)
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_circle_outline_sharp),
              )
            else
              CircularIcon(iconPath: subscription.imagePath, size: 60),
          ],
        ),
      ),
    );
  }
}
