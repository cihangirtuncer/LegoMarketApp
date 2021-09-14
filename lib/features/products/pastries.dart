import 'package:flutter/material.dart';
import 'package:lego_market_app/core/widget/list_map/product_map_list.dart';

import '../../../../core/components/scaffold/products_scaffold.dart';
import '../../utils/dbhelper.dart';
import '../model/products.dart';

class PastriesList extends StatefulWidget {
  PastriesList({Key key}) : super(key: key);

  @override
  _PastriesListState createState() => _PastriesListState();
}

class _PastriesListState extends State<PastriesList> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Pastries").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "PASTRIES",
      ListView(
        children: foodItemCreat(context, allFoodList),
      ),
    );
  }
}
