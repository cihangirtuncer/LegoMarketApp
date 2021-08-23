import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/icon/bottom_icon.dart';
import 'package:lego_market_app/view/home/home_screen.dart';
import 'package:lego_market_app/view/orders/orders_screen.dart';
import 'package:lego_market_app/view/profile/profile_screen.dart';
import 'package:lego_market_app/view/search/search_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final tabs = [
    HomePage(),
    Search(),
    Orders(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade900,
        items: [
          BottomNavigationBarItem(
              icon: BuildStandartIcon(Icons.home),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: BuildStandartIcon(Icons.search),
              label: "Search",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: BuildStandartIcon(Icons.shopping_cart),
              label: "Orders",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: BuildStandartIcon(Icons.account_circle_rounded),
              label: "Profile",
              backgroundColor: Colors.black),
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
