import 'package:flutter/material.dart';
import 'package:lego_market_app/product/model/products.dart';

import '../../../../core/components/scaffold/products_scaffold.dart';
import '../../../../utils/dbhelper.dart';
import '../../../core/widget/product_map_list.dart';

class BabyCareList extends StatefulWidget {
  BabyCareList({Key? key}) : super(key: key);

  @override
  _BabyCareListState createState() => _BabyCareListState();
}

class _BabyCareListState extends State<BabyCareList> {
  late DatabaseHelper databaseHelper;
  late List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>.empty(growable: true);
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Babycare").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildProductsScaffold(
      "BABY CARE",
      foodItemCreat(context, allFoodList),
    );
  }
}
