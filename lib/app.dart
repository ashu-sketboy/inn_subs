import 'package:flutter/material.dart';

import 'core/navigation/go_route_generator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return _App();
  }
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        iconTheme: IconThemeData(color: Color(0xFFB0B3B8)),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(backgroundColor: Color(0xff242526)),
        ),
      ),
      routerConfig: GoRouterGenerator.instance().router,
    );
  }
}
