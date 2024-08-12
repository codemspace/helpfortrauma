import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';
import 'package:helpfortrauma/core/init/provider_list.dart';
import 'package:helpfortrauma/screens/auth/forgot_password_screen.dart';
import 'package:helpfortrauma/screens/auth/otp_verification.dart';
import 'package:helpfortrauma/screens/auth/reset_password.dart';
import 'package:helpfortrauma/screens/auth_home/auth_home.dart';
import 'package:helpfortrauma/screens/contact_us/contact_us_screen.dart';
import 'package:helpfortrauma/screens/auth/signin_screen.dart';
import 'package:helpfortrauma/screens/auth/signup_screen.dart';
import 'package:helpfortrauma/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MyApp();
        }, future: null,
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Block',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // Light background color for AppBar
          foregroundColor: Colors.black, // Text and icons color in AppBar
          elevation: 0
        ),
        scaffoldBackgroundColor: Colors.white, // Light background color for Scaffold
        colorScheme: ColorScheme.light(
          primary: greenColor, // Retain greenColor for primary elements if desired
          secondary: secondaryColor, // Retain secondaryColor for secondary elements
          error: Colors.red, // Customize as needed for errors
        ),
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black), // Text color suitable for light theme
        canvasColor: Colors.grey[200], // Light grey color for material canvases,
      ),
      initialRoute: '/signin', // Set initial route to signup or signin based on your choice
      routes: { 
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/otp-verification': (context) => OTPVerificationScreen(),
        '/reset-password': (context) => ResetPasswordScreen(),
        // '/signin': (context) => Login(title: "Wellcome to the Admin & Dashboard Panel"),
        '/home': (context) => HomeScreen(),
        '/auth-home': (context) => AuthHomeScreen(),
        '/contact-us': (context) => ContactUsScreen(),
      },
      // home: Login(title: "Wellcome to the Admin & Dashboard Panel"),
    );
  }
}
