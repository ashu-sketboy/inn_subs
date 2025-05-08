import 'package:flutter/material.dart' show BuildContext;
import 'package:go_router/go_router.dart';
import 'package:inn_subs/features/dashboard/presentation/dashboard_screen.dart';
import 'package:inn_subs/features/intro/presentation/get_started_screen.dart';
import 'package:inn_subs/features/my_subscriptions/presentation/my_subscription_screen.dart';

class GoRouterGenerator {
  static GoRouterGenerator? _instance;

  final GoRouter router;

  GoRouterGenerator._({required this.router});

  BuildContext? get context =>
      router.routerDelegate.navigatorKey.currentContext;

  factory GoRouterGenerator.instance() {
    if (_instance == null) {
      final GoRouter router = GoRouter(
        routes: [
          GoRoute(
            path: GetStartedScreen.route,
            builder: (context, state) => GetStartedScreen(),
          ),
          GoRoute(
            name: DashboardScreen.route,
            path: DashboardScreen.route,
            builder: (context, state) => MySubscriptionScreen(),
          ),
          GoRoute(
            path: MySubscriptionScreen.route,
            builder: (context, state) => MySubscriptionScreen(),
          ),
        ],
        // redirect: (context, state) async {},
      );

      _instance = GoRouterGenerator._(router: router);
      return _instance!;
    } else {
      return _instance!;
    }
  }
}
