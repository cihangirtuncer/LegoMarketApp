import 'package:flutter/material.dart';
import '../../../features/view/home/home_screen.dart';
import '../../../features/view/orders/orders_screen.dart';
import '../../../features/view/profile/profile_screen.dart';
//import '../../../features/view/search/search_screen.dart';
import '../icon/bottom_icon.dart';

class BottomHomePage extends StatefulWidget {
  @override
  _BottomHomePageState createState() => _BottomHomePageState();
}

class _BottomHomePageState extends State<BottomHomePage> {
  int _selectedIndex = 0;
  final tabs = [
    HomePage(),
    //Search(),
    OrdersScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xF504094E),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xF504094E),
        selectedIconTheme: IconThemeData(
          color: Color(0xF504094E),
        ),
        unselectedItemColor: Colors.grey.shade800,
        items: [
          BottomNavigationBarItem(
            icon: BuildBottomIcon(
              Icons.home,
            ),
            label: "HOME",
            backgroundColor: Colors.white,
          ),
          // BottomNavigationBarItem(
          //  icon: BuildBottomIcon(
          //    Icons.search,
          //  ),
          //  label: "SEARCH",
          //  backgroundColor: Colors.white,
          // ),
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
