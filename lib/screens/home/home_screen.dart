import 'package:flutter/material.dart';
import 'package:helpfortrauma/screens/dashboard/dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            Expanded(
              // It takes 5/6 part of the screen
              flex: 1,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
