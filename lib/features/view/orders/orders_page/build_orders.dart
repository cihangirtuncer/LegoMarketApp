import 'package:flutter/material.dart';

import '../../../../core/components/card/orders_card.dart';
import '../../../../utils/dbhelper.dart';
import '../../../model/products.dart';

class BuildOrders extends StatefulWidget {
  BuildOrders({Key key}) : super(key: key);

  @override
  _BuildOrdersState createState() => _BuildOrdersState();
}

class _BuildOrdersState extends State<BuildOrders> {
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
        title: Center(
          child: Text("Orders"),
        ),
        backgroundColor: Colors.indigo.shade900,
      ),
      backgroundColor: Colors.grey.shade300,
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
            product.explanation,
            product.price,
            product.id,
          ),
        )
        .toList();
  }
}
