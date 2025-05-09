import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inn_subs/core/helper/screen_status.dart';
import 'package:inn_subs/core/widgets/circular_icon.dart';
import 'package:inn_subs/features/my_subscriptions/domain/bloc/my_subs_bloc.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';

class MySubscriptionScreen extends StatefulWidget {
  const MySubscriptionScreen({super.key});

  static const String route = "/mySubscriptions";

  @override
  State<MySubscriptionScreen> createState() => _MySubscriptionScreenState();
}

class _MySubscriptionScreenState extends State<MySubscriptionScreen> {
  @override
  void initState() {
    MySubsBloc bloc = BlocProvider.of<MySubsBloc>(context);
    MySubsState state = bloc.state;
    if (state.subscriptionCategory.isEmpty || state.subscription.isEmpty) {
      bloc.add(MySubsEvent.loadData());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<MySubsBloc, MySubsState>(
        builder: (context, state) {
          if (state.status is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            spacing: 12,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Chip(
                      label: Text(
                        "All Subs",
                        style: TextStyle(color: Colors.white),
                      ),

                      backgroundColor:
                          state.currentSelectedCategory == 0
                              ? Colors.blue
                              : null,
                    ),
                    for (SubscriptionCategory category
                        in state.subscriptionCategory) ...{
                      Chip(
                        label: Text(
                          category.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    },
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  itemCount: state.subscription.length,
                  itemBuilder: (context, index) {
                    return SubscriptionCard(
                      subscription: state.subscription[index],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

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
                  SizedBox(height: 10),
                  Chip(
                    label: Text(
                      "\$${subscription.price} / ${subscription.period}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            CircularIcon(iconPath: subscription.imagePath, size: 60),
          ],
        ),
      ),
    );
  }
}
