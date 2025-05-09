import 'package:flutter/material.dart';

class MySubscriptionScreen extends StatelessWidget {
  const MySubscriptionScreen({super.key});
  static const String route = "/mySubscriptions";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(child: ListView.builder(itemBuilder: (context, i) {})),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
        ),
      ],
    );
  }
}
