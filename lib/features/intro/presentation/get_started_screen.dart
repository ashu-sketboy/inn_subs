import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inn_subs/features/dashboard/presentation/dashboard_screen.dart';
import 'package:inn_subs/features/intro/presentation/widgets/icons_presenter.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});
  static const String route = "/";

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  List<String> icons = [
    'assets/icons/ai.png',
    'assets/icons/youtube.png',
    'assets/icons/figma.png',
    'assets/icons/linkedin.png',
    'assets/icons/spotify.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(DashboardScreen.route);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "Get Started",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconsPresenter(icons: icons),
            const SizedBox(height: 32),
            Text(
              "Manage all your subscriptions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Keep regular expenses on hand and receive timely notifications of upcoming fees",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
