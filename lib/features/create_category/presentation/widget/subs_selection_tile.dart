import 'package:flutter/material.dart';
import 'package:inn_subs/core/widgets/circular_icon.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';

class SubsSelectionTile extends StatelessWidget {
  const SubsSelectionTile({
    super.key,
    required this.subscription,
    required this.idx,
    required this.onTap,
    this.selected = false,
  });
  final Subscription subscription;
  final bool selected;
  final int idx;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xff242526),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularIcon(iconPath: subscription.imagePath, size: 60),
          Expanded(
            child: Text(
              subscription.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onTap(idx);
            },
            child:
                selected
                    ? Icon(Icons.check_circle, color: Colors.blue)
                    : Icon(Icons.circle_outlined, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
