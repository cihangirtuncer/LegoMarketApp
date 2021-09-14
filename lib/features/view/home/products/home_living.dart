import 'package:flutter/material.dart';
import 'package:lego_market_app/features/model/products.dart';
import 'package:lego_market_app/utils/dbhelper.dart';
import '../../../../core/components/scaffold/products_scaffold.dart';

import '../home_page/product_list.dart';

class HomeLivingList extends StatefulWidget {
  HomeLivingList({Key key}) : super(key: key);

  @override
  _HomeLivingListState createState() => _HomeLivingListState();
}

class _HomeLivingListState extends State<HomeLivingList> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Homeliving").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "HOME LIVING",
      ListView(
        children: foodItemCreat(),
      ),
    );
  }

// ignore: missing_return
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
