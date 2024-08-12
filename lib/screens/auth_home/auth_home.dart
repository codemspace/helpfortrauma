import 'package:flutter/material.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';
import 'package:helpfortrauma/screens/auth_home/app_integration_screen.dart';
import 'package:helpfortrauma/screens/layouts/footer.dart';
import 'package:helpfortrauma/screens/layouts/header.dart';

class AuthHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    pinned: true,
                    floating: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Header(),
                    ),
                  ),
                  SliverPadding(padding: EdgeInsets.all(defaultPadding * 2)),
                  SliverToBoxAdapter(child: AppIntegrationsScreen()),
                  SliverPadding(padding: EdgeInsets.all(defaultPadding * 2)),
                  SliverToBoxAdapter(child: Footer()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
