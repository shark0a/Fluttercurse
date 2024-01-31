import 'package:flutter/material.dart';
import 'package:task/views/nav_screens/categorie_screen.dart';
import 'package:task/views/nav_screens/main_screen.dart';
import 'package:task/views/nav_screens/setting_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageindex = 0;
  List<Widget> pages = [
    MainScreen(),
    CategorieScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageindex,
          onTap: onNavBarTaped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categoris'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }

  onNavBarTaped(int index) {
    pageindex = index;
    setState(() {});
  }
}
