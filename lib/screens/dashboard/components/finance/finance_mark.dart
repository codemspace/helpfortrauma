import 'package:flutter/material.dart';

class FinanceMark extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const FinanceMark({
    Key? key,
    required this.icon,
    required this.text,
    this.color = Colors.green, // Default color is green, can be customized
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        SizedBox(width: 8), // Spacing between icon and text
        Text(text, style: TextStyle(color: color)),
      ],
    );
  }
}
