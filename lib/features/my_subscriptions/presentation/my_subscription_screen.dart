import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inn_subs/core/helper/status/screen_status.dart';
import 'package:inn_subs/features/create_category/presentation/add_category_screen.dart';
import 'package:inn_subs/features/my_subscriptions/domain/bloc/my_subs_bloc.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscription/subscription.dart';
import 'package:inn_subs/features/my_subscriptions/domain/model/subscriptionCategory/subscription_category.dart';
import 'package:inn_subs/features/my_subscriptions/presentation/widget/subscription_card.dart';

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
    if (state.subscriptionCategory.isEmpty || state.mySubscriptions.isEmpty) {
      bloc.add(MySubsEvent.loadMyData());
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
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<MySubsBloc>(
                          context,
                        ).add(MySubsEvent.selectCurrentCategory(categoryId: 0));
                      },
                      child: Chip(
                        backgroundColor:
                            state.currentSelectedCategory == 0
                                ? Colors.blue
                                : null,
                        label: Text(
                          "All Subs",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    for (SubscriptionCategory category
                        in state.subscriptionCategory) ...{
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<MySubsBloc>(context).add(
                            MySubsEvent.selectCurrentCategory(
                              categoryId: category.id,
                            ),
                          );
                        },
                        child: Chip(
                          backgroundColor:
                              category.id == state.currentSelectedCategory
                                  ? Colors.blue
                                  : null,
                          label: Text(
                            category.name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                    },
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                          ),
                          builder: (context) {
                            return AddCategoryScreen(
                              category: state.subscriptionCategory,
                              mySubscriptions: state.mySubscriptions,
                            );
                          },
                        ).then((newCategoryCreated) {
                          if (newCategoryCreated == true && context.mounted) {
                            BlocProvider.of<MySubsBloc>(
                              context,
                            ).add(MySubsEvent.loadMyData());
                          }
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  itemCount: state.mySubscriptions.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SubscriptionCard(
                        subscription: Subscription(
                          id: -1,
                          name: 'Add Subscription',
                          price: 0,
                          period: '',
                          imagePath: '',
                          textColor: 0xFFFFFFFF,
                          bgColor: 0xFF0000FF,
                        ),
                        index: index,
                      );
                    }

                    if (state.currentSelectedCategory == 0 ||
                        state.currentSelectedCategory ==
                            state.mySubscriptions[index - 1].parentId) {
                      return SubscriptionCard(
                        subscription: state.mySubscriptions[index - 1],
                        index: index,
                      );
                    }
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
