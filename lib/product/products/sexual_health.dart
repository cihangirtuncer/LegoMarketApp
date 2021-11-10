import 'package:flutter/material.dart';
import 'package:lego_market_app/product/model/products.dart';
import '../../../core/widget/product_map_list.dart';
import '../../../utils/dbhelper.dart';
import '../../../../core/components/scaffold/products_scaffold.dart';

class SexualHealthList extends StatefulWidget {
  @override
  _SexualHealthListState createState() => _SexualHealthListState();
}

class _SexualHealthListState extends State<SexualHealthList> {
  late DatabaseHelper databaseHelper;
  late List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>.empty(growable: true);
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("SexualHealth").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildProductsScaffold(
      "SEXUAL HEALTH",
      foodItemCreat(context, allFoodList),
    );
  }
}
