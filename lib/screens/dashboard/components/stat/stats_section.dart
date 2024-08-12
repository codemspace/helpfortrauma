import 'package:flutter/material.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';
import 'package:helpfortrauma/screens/dashboard/components/stat/stat_row.dart';

import 'stat_card.dart';

class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 5, vertical: defaultPadding * 5),
      color: primaryColor, // Set the background color to match your theme
      child: Column(
        children: [
          Text(
            "Why do over 5M members love?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Enim sed parturient sem enim nunc sit erat velit eget hac nulla nisl ornare risus risus consequat",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          Text(
            "nunc nisl pellentesque diam neque.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 44),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatCard(title: "Flexible payments", description: "you are able to run your business smoothly; handle your daily expenses and secure your cash flow."),
              StatCard(title: "Smart payments", description: "Nullam sodales, libero ac dictum convallis, ipsum diam cursus stibulum lacinia ultricies eleifend."),
              StatCard(title: "Easy administration", description: "In a odio sit amet nisi tincidunt congue. Mauris cursus magna a vestibulum rutrum.")
            ],
          ),
          SizedBox(height: 46),
          Divider(color: Colors.white.withOpacity(0.5), thickness: 1),
          SizedBox(height: 28),
          StatRow(),
        ],
      ),
    );
  }
}
