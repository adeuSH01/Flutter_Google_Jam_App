import 'package:flutter/material.dart';
import 'package:flutty/pages/activity.dart';
import 'package:flutty/pages/duties.dart';
import 'package:flutty/pages/home.dart';
import 'package:flutty/pages/login.dart';
import 'package:flutty/pages/profile.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Home(),
    TableEventsExample(),
    Activity(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Anasayfa'),
            activeColor: Colors.teal,
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            title: Text('Görevler'),
            activeColor: Colors.teal,
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.list_alt),
            title: Text('Aktiviteler'),
            activeColor: Colors.teal,
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
            activeColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

