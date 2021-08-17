import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/appBar/main_app_bar.dart';
import 'package:lego_market_app/view/account/account_page.dart';
import 'package:lego_market_app/view/home/home_page.dart';
import 'package:lego_market_app/view/orders/orders_page.dart';
import 'package:lego_market_app/view/product_search/product_search_page.dart';

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
      appBar: mainAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey.shade600,
              ),
              label: "HOME",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              label: "SEARCH",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.hot_tub,
                color: Colors.grey.shade600,
              ),
              label: "MY ORDER",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
                color: Colors.grey.shade600,
              ),
              label: "MY ACCOUNT",
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
