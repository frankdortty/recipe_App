import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:AnimatedSplashScreen(
        splash: 'assets/recipe.jpg',
        splashIconSize: 300,
        curve: Curves.easeInBack,
        duration: 2000,
        backgroundColor: Colors.black,
        animationDuration: const Duration(milliseconds: 1500),
        nextScreen: const HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}










