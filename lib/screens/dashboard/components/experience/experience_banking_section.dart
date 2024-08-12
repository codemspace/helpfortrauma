import 'package:flutter/material.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class ExperienceBankingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 5, vertical: 80),
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [Color(0xFF6A0DAD), Color(0xFFD500F9)], // Example gradient colors
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        // ),
        color: primaryColor
        // If you have a pattern like the one in the image, consider using a Stack and adding a pattern image as a Positioned.fill widget.
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Experience the next-gen banking',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Enim sed parturient sem enim nunc sit erat velit eget hac nulla nullam et id praesent nisi ornare risus risus',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
            ),
          ),
          Text(
            'consequat nunc nisl pellentesque diam neque.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // Action to open an account
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.deepPurple[700], // Button background color
              backgroundColor: Colors.white, // Text color
            ),
            child: Text('Open an account today'),
          ),
        ],
      ),
    );
  }
}
