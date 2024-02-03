import 'package:flutter/material.dart';
import 'package:shopping/const.dart';
import 'package:shopping/views/nav_screens/categorie_screen.dart';
import 'package:shopping/views/nav_screens/main_screen.dart';
import 'package:shopping/views/nav_screens/setting_screen.dart';
import 'package:shopping/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageindex = 0;
  String username = "";
  List<Widget> pages = [
    const MainScreen(),
    const CategorieScreen(),
    const SettingScreen(),
  ];
  @override
  void initState() {
    
    super.initState();
    getusername();
  }

  Future<void> getusername() async {
    username = await AppSettings.getCashedusername();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screens'),
        backgroundColor: Colors.amber,
      ),
      drawer: Drawerr(username: username),
      body: pages[pageindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageindex,
          onTap: onNavBarTaped,
          items: const [
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
