import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/scaffold/products_scaffold.dart';
import '../../../models/products.dart';
import '../../../utils/dbhelper.dart';
import '../home_page/product_list.dart';

class DairyAndBreakfastList extends StatefulWidget {
  @override
  _DairyAndBreakfastListState createState() => _DairyAndBreakfastListState();
}

class _DairyAndBreakfastListState extends State<DairyAndBreakfastList> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("DairyBreakfast").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "DAIRY & BREAKFAST",
      ListView(
        children: foodItemCreat(),
      ),
    );
  }

  List<Column> foodItemCreat() {
    return allFoodList
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
