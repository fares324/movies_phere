import 'package:flutter/material.dart';
import 'package:movie_sphere/screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ));
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splash.png',
          height: 300,
        ),
      ),
    );
  }
}
