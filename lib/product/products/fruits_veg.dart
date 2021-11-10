import 'package:flutter/material.dart';
import 'package:lego_market_app/product/model/products.dart';
import '../../../core/widget/product_map_list.dart';
import '../../../utils/dbhelper.dart';
import '../../../../core/components/scaffold/products_scaffold.dart';

class FruitsVegList extends StatefulWidget {
  FruitsVegList({Key? key}) : super(key: key);

  @override
  _FruitsVegListState createState() => _FruitsVegListState();
}

class _FruitsVegListState extends State<FruitsVegList> {
  late DatabaseHelper databaseHelper;
  late List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>.empty(growable: true);
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Fruitsveg").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildProductsScaffold(
      "FRUIT & VEG",
      foodItemCreat(context, allFoodList),
    );
  }
}
