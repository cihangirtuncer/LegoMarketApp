import 'package:flutter/material.dart';
import '../../../core/widget/product_map_list.dart';
import '../../model/products.dart';
import '../../../utils/dbhelper.dart';

import '../../../../core/components/scaffold/products_scaffold.dart';

class WaterList extends StatefulWidget {
  @override
  _WaterListState createState() => _WaterListState();
}

class _WaterListState extends State<WaterList> {
  late DatabaseHelper databaseHelper;
  late List<Products> allWaterList;
  int id = 1;

  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allWaterList = List<Products>.empty(growable: true);
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
    return buildProductsScaffold(
      "WATER",
      ListView(
        physics: BouncingScrollPhysics(),
        children: foodItemCreat(context, allWaterList),
      ),
    );
  }
}
