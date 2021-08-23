import 'package:flutter/material.dart';

class OrdersAppBar extends StatefulWidget {
  const OrdersAppBar({Key? key}) : super(key: key);
  @override
  _OrdersAppBarState createState() => _OrdersAppBarState();
}

class _OrdersAppBarState extends State<OrdersAppBar>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'ORDERS',
    ),
    Tab(text: 'PREVIOUS ORDERS'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(
          child: Text(
            "Orders",
            style: TextStyle(fontSize: 23),
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.white,
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text!.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      ),
    );
  }
}
