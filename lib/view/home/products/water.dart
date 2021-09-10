import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';
import 'package:lego_market_app/models/products.dart';
import 'package:lego_market_app/utils/dbhelper.dart';
import 'package:lego_market_app/view/home/home_page/product_list.dart';

class WaterList extends StatefulWidget {
  @override
  _WaterListState createState() => _WaterListState();
}

class _WaterListState extends State<WaterList> {
  DatabaseHelper databaseHelper;
  List<Products> allWaterList;
  int id = 1;

  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allWaterList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Water").then((allWaterMapList) {
      for (Map readMap in allWaterMapList) {
        allWaterList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "WATER",
      ListView(
        children: foodItemCreat(),
      ),
    );
  }

  List<Column> foodItemCreat() {
    return allWaterList
        .map(
          (product) => BuildProductList(
            context,
            product.name,
            product.explanation,
            product.price,
          ),
        )
        .toList();
  }
}
