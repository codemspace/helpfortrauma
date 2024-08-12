import 'package:flutter/material.dart';
import 'package:helpfortrauma/screens/dashboard/components/finance/finance_mark.dart';

class FinanceMarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white, // Set background color if needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Evenly space the features
        children: [
          FinanceMark(
            icon: Icons.check_circle, // Replace with your actual icon
            text: '24/7 account monitoring',
          ),
          SizedBox(width: 50),
          FinanceMark(
            icon: Icons.check_circle, // Replace with your actual icon
            text: 'Protection & peace of mind',
          ),
          SizedBox(width: 50),
          FinanceMark(
            icon: Icons.check_circle, // Replace with your actual icon
            text: 'Anytime, anywhere support',
          ),
          SizedBox(width: 50),
          FinanceMark(
            icon: Icons.check_circle, // Replace with your actual icon
            text: 'Serious security',
          ),
        ],
      ),
    );
  }
}
