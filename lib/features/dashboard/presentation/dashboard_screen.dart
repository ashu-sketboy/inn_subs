import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inn_subs/core/widgets/custom_appbar.dart';
import 'package:inn_subs/features/general/presentation/general_screen.dart';
import 'package:inn_subs/features/my_subscriptions/domain/bloc/my_subs_bloc.dart';
import 'package:inn_subs/features/my_subscriptions/presentation/my_subscription_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String route = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late final CustomSegmentedController<int> controller;
  late final PageController pageController;

  void onTabChange(int val) {
    if (val != pageController.page) {
      pageController.jumpToPage(val);
    }
  }

  @override
  void initState() {
    controller = CustomSegmentedController<int>();
    controller.addListener(() {
      onTabChange(controller.value ?? 1);
    });
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<MySubsBloc>(
        create: (context) => MySubsBloc(),
        child: Scaffold(
          appBar: CustomAppbar(controller: controller),
          body: PageView.builder(
            controller: pageController,
            itemCount: 2,
            itemBuilder: (context, i) {
              switch (i) {
                case 0:
                  return GeneralScreen();
                case 1:
                  return MySubscriptionScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
