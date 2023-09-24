import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/display': (context) => Display(name: "", age: 0),
      },
    );
  }
}
