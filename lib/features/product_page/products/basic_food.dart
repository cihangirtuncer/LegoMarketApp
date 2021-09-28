import 'package:flutter/material.dart';

import '../../../../core/components/scaffold/products_scaffold.dart';
import '../../../core/widget/product_map_list.dart';
import '../../../utils/dbhelper.dart';
import '../../model/products.dart';

class BasicFood extends StatefulWidget {
  @override
  _BasicFoodState createState() => _BasicFoodState();
}

class _BasicFoodState extends State<BasicFood> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("BasicFood").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "BASIC FOOD",
      ListView(
        children: foodItemCreat(context, allFoodList),
      ),
    );
  }
}
