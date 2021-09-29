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
        child: ListView(
          children: <Widget>[
            Container(
              child: DrawerHeader(child: CircleAvatar()),
              color: Colors.tealAccent,
            ),
            Container(
              color: Colors.blueAccent,
              child: Column(
                children: List.generate(4, (int index) {
                  return ListTile(
                    leading: Icon(Icons.info),
                  );
                }),
              ),
            )
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
