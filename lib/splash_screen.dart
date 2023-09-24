import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToMainScreen();
  }

  void navigateToMainScreen() async {
    await Future.delayed(
        Duration(seconds: 2)); // Set the duration of the splash screen

    Navigator.pushReplacementNamed(
        context, '/home'); // Navigates to the main app screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
            'assets/images/splash.jpg'), // Replace with your splash screen image path
      ),
    );
  }
}
