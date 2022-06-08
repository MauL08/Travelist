import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travelist/screens/home_screen/home_screen.dart';
import 'package:travelist/screens/places_screen/places_screen.dart';
import 'package:travelist/screens/profile_screen/profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _navIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    const PlacesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_navIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.lightBlue.shade300,
        buttonBackgroundColor: const Color(0xFF177FE4),
        backgroundColor: Colors.indigo.shade500,
        height: 60,
        index: _navIndex,
        onTap: (index) {
          setState(() {
            _navIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            size: 30.0,
            color: _navIndex == 0 ? Colors.white : Colors.black,
          ),
          Icon(
            Icons.wallet_travel_rounded,
            size: 30.0,
            color: _navIndex == 1 ? Colors.white : Colors.black,
          ),
          Icon(
            Icons.account_circle_rounded,
            size: 30.0,
            color: _navIndex == 2 ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }
}
