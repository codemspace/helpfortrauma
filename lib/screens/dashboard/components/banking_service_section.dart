import 'package:flutter/material.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class BankingServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 5, vertical: 40),
      color: primaryColor, // Example purple shade, adjust color as needed. 
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: defaultPadding * 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Meet the next gen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'banking service',
                    style: TextStyle(
                      color: darkYellowColor,
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enim sed parturient sem enim nunc sit erat velit eget '
                    'hac nulla nullam et id praesent nisi ornare risus risus consequat.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {}, // Define what happens when the button is pressed.
                        child: Text('Get Started'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bgColor, // Button background color
                          foregroundColor: Colors.white, // Text color
                        ),
                      ),
                      SizedBox(width: 20),
                      OutlinedButton(
                        onPressed: () {}, // Define what happens when the button is pressed.
                        child: Text('Contact Sales'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: darkYellowColor, // Text color
                          side: BorderSide(color: darkYellowColor, width: 2), // Border color and width
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/images/finance/finance-tab-3.jpg', // Replace with your actual image URL
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
            )
          ),
        ],
      ),
    );
  }
}
