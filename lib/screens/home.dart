import 'package:flutter/material.dart';
import 'package:movie_sphere/screens/pages/home_page.dart';
import 'package:movie_sphere/screens/pages/movies_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children:const <Widget>[
            Center(
            child: HomePage(),
          ),
            Center(
            child: MoviesPage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;

            pageController.animateToPage(index,
                duration: const Duration(microseconds: 300),
                curve: Curves.bounceInOut);
          });
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.blueGrey,
      ),
    );
  }
}
