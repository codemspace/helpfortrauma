import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 5, vertical: 40),
      color: Colors.grey[200], // Background color for the footer
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: logoAndSubscription()),
              Expanded(child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  linksColumn("Landings", ["SaaS", "Software Company", "Finance", "Digital Agency", "Conference", "App Template"]),
                  linksColumn("Accounts", ["Register", "Login", "Forgot Password", "Reset Password", "Profile"]),
                  linksColumn("Resources", ["Docs", "Support", "Changelog", "Help Center", "Community", "Webinars"]),
                ],
              ))
            ],
          ),
          SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end, 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Copyright © 2024 Block Bootstrap 5 Theme | Designed by CodesCandy"),
              socialIcons(),
            ]
          )
        ],
      ),
    );
  }
}

Widget logoAndSubscription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        'assets/icons/logo.svg',
        width: 100, // Adjust size according to the screen width
      ),
      SizedBox(height: 20),
      Text(
        "Build faster websites with Block multipurpose bootstrap 5 template. Duis imper diet mollis leo, quis ultrices erat ultrices simple dummy.",
        style: TextStyle(color: Colors.grey[800]),
      ),
      SizedBox(height: 28),
      newsletterSubscription()
    ],
  );
}

Widget linksColumn(String title, List<String> links) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      SizedBox(height: 20),
      ...links.map((link) => Text(link, style: TextStyle(color: Colors.grey[600]))).toList(),
    ],
  );
}

Widget newsletterSubscription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Subscribe to our newsletter", style: TextStyle(fontWeight: FontWeight.bold, color: greyText)),
      SizedBox(height: 12),
      SizedBox(  // Specify the width
        width: 300, // Adjust the width according to your design requirements
        child: TextField(
          decoration: InputDecoration(
            labelText: "Email address",
            suffixIcon: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: primaryColor, // Button color
                backgroundColor: Colors.white, // Text color
              ),
              child: Text("Subscribe"),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget socialIcons() {
  return Row(
    children: [
      Icon(Icons.settings, color: Colors.grey),
      SizedBox(width: 10),
      Icon(Icons.camera, color: Colors.grey),
      SizedBox(width: 10),
      Icon(Icons.facebook, color: Colors.grey),
      SizedBox(width: 10),
      Icon(Icons.wifi, color: Colors.grey),
    ],
  );
}


