import 'package:flutter/material.dart';
import 'package:movie_sphere/screens/splash_screen.dart';

void main() {
  runApp(const MovieSphere());
}

class MovieSphere extends StatelessWidget {
  const MovieSphere({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieSphere',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white
        ),
        bodySmall: TextStyle(
            color: Colors.white
      ),
        ),
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      home:const SplashScreen(),
       
    );
  }
}
