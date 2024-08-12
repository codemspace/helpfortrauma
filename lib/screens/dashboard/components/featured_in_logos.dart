import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';

class FeaturedInLogos extends StatelessWidget {
  final List<String> featuredLogos = [
    'assets/images/client-logo/clients-logo-1.svg',
    'assets/images/client-logo/clients-logo-2.svg',
    'assets/images/client-logo/clients-logo-3.svg',
    'assets/images/client-logo/clients-logo-4.svg',
    'assets/images/client-logo/clients-logo-5.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "AS FEATURED IN",
            style: TextStyle(fontSize: 16, color: greyText, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: featuredLogos.map((logo) => SvgPicture.asset(logo, height: 50)).toList(),
          ),
        ],
      ),
    );
  }
}
