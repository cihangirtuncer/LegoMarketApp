import 'package:flutter/material.dart';
import 'package:lego_market_app/view/home/home_page.dart';
import 'package:lego_market_app/view/orders/orders_page.dart';
import 'package:lego_market_app/view/product_search/search_page.dart';
import 'package:lego_market_app/view/profile/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final tabs = [
    HomePage(),
    ProductSearch(),
    MyOrders(),
    MyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey.shade600,
              ),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              label: "Search",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey.shade600,
              ),
              label: "Orders",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.grey.shade600,
              ),
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
    setState(() {
      _selectedIndex = index;
    });
  }
}
