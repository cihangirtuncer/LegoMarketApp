import 'package:flutter/material.dart';

import '../../core/components/card/orders_card.dart';
import '../../models/products.dart';
import '../../utils/dbhelper.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Orders").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(
          child: Text("ORDERS"),
        ),
      ),
      body: ListView(
        children: foodItemCreat(),
      ),
    );
  }

  List<Column> foodItemCreat() {
    return allFoodList
        .map(
          (product) => BuildOrdersCard(
            context,
            product.name,
          ),
        )
        .toList();
  }
}
