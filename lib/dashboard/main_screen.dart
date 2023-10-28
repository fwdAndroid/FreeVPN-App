import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vpn_basic_project/dashboard/help.dart';
import 'package:vpn_basic_project/dashboard/settings.dart';
import 'package:vpn_basic_project/screens/home_screen.dart';
import 'package:vpn_basic_project/screens/location_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    LocationScreen(), // Replace with your screen widgets
    HomeScreen(),
    Settings(),
    Help()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xffFAFAFA),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Countries",
              icon: Icon(
                Icons.flag,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: "Connecting",
              icon: Icon(
                Icons.wifi,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: "Setting",
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: "Help",
              icon: Icon(
                Icons.help_center,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
