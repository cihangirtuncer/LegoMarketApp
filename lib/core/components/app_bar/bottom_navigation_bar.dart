import 'package:flutter/material.dart';
import 'package:lego_market_app/features/view/home/home_screen.dart';
import 'package:lego_market_app/features/view/orders/orders_screen.dart';
import 'package:lego_market_app/features/view/profile/profile_screen.dart';
import 'package:lego_market_app/features/view/search/search_screen.dart';
import '../icon/bottom_icon.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final tabs = [
    HomePage(),
    Search(),
    OrdersScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade900,
        selectedIconTheme: IconThemeData(color: Colors.blue.shade900),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: BuildBottomIcon(Icons.home),
            label: "HOME",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: BuildBottomIcon(
              Icons.search,
            ),
            label: "SEARCH",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: BuildBottomIcon(
              Icons.shopping_cart,
            ),
            label: "ORDERS",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: BuildBottomIcon(
              Icons.account_circle_rounded,
            ),
            label: "PROFILE",
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.shifting,
      ),
      body: tabs[_selectedIndex],
    );
  }

  void onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }
}
