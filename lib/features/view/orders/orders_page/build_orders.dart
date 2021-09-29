import 'package:flutter/material.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

import '../../../../core/components/card/orders_card.dart';
import '../../../../utils/dbhelper.dart';
import '../../../model/products.dart';

class BuildOrders extends StatefulWidget {
  BuildOrders({Key? key}) : super(key: key);

  @override
  _BuildOrdersState createState() => _BuildOrdersState();
}

class _BuildOrdersState extends State<BuildOrders> {
  late DatabaseHelper databaseHelper;
  late List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>.empty(growable: true);
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
      appBar: MainAppBar(
          Text(
            "Orders",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          false),
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
