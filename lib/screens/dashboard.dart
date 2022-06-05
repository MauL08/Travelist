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
    const HomeScreen(),
    const PlacesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_navIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade300,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        onTap: (index) {
          setState(() {
            _navIndex = index;
          });
        },
        currentIndex: _navIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_travel_rounded,
              size: 30.0,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 30.0,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
