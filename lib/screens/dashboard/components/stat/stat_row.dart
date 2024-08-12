import 'package:flutter/material.dart';

class StatRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatItem(label: "5M+", description: "Members"),
        StatItem(label: "95%", description: "Customer satisfaction"),
        StatItem(label: "73%", description: "Over year growth"),
        StatItem(label: "250B", description: "Money managed"),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final String description;

  const StatItem({
    Key? key,
    required this.label,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
        ),
      ],
    );
  }
}
