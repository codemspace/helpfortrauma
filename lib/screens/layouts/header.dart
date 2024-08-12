import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';
import 'package:helpfortrauma/responsive.dart';
import 'package:helpfortrauma/screens/dashboard/components/main_dropdown_menu.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 5, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          if (!Responsive.isMobile(context))
            SvgPicture.asset(
              'assets/icons/logo.svg',
              width: 100, // Adjust size according to the screen width
            ),
          Expanded(
            child: Center(
              child: MainMenu(),
            ),
          ),
          if (!Responsive.isMobile(context))
            ProfileCard(),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile_pic.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text("Artem Pop"),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainDropdownMenu(
            title: 'Landings',
            items: {
              'Landing Overview': '/landing-overview',
              'SaaS v1': '/saas-v1',
              'SaaS v2': '/saas-v2',
              'Agency': '/agency',
              'Application': '/application',
              'Finance': '/finance',
              'Marketing': '/marketing',
              'Portfolio': '/portfolio',
              'Web Application': '/web-application',
            },
          ),
          MainDropdownMenu(
            title: 'Pages',
            items: {
              'Contact Us': '/contact-us',
              'HomePage': '/home',
              'Authenticated HomePage': '/auth-home',
            },
          ),
          MainDropdownMenu(
            title: 'Accounts',
            items: {
              'Sign Up': '/signup',
              'Sign In': '/signin',
              'Reset Password': '/reset-password',
              'Settings': '/settings',
              'Account Details': '/account-details',
              'Manage Subscription': '/manage-subscription',
            },
          ),
          MainDropdownMenu(
            title: 'Resources',
            items: {
              'Blog': '/blog',
              'Help Center': '/help-center',
              'Contact': '/contact-us',
              'Privacy Policy': '/privacy-policy',
              'Terms & Conditions': '/terms-conditions',
            },
          ),
        ],
      );
  }
}