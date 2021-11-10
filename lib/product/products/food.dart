import 'package:flutter/material.dart';
import 'package:lego_market_app/product/model/products.dart';

import '../../../../core/components/scaffold/products_scaffold.dart';
import '../../../core/widget/product_map_list.dart';
import '../../../utils/dbhelper.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  late DatabaseHelper databaseHelper;
  late List<Products> allFoodList;
  int id = 1; // try
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>.empty(growable: true);
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Foods").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildProductsScaffold(
      "FOODS",
      foodItemCreat(context, allFoodList),
    );
  }
}
