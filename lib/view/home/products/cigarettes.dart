import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/scaffold/products_scaffold.dart';
import '../../../models/products.dart';
import '../../../utils/dbhelper.dart';
import '../home_page/product_list.dart';

class CigarettesList extends StatefulWidget {
  @override
  _CigarettesListState createState() => _CigarettesListState();
}

class _CigarettesListState extends State<CigarettesList> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Cigarettes").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "CIGARETTES",
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
