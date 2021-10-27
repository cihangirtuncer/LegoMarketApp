import 'package:flutter/material.dart';

import '../../../../core/components/scaffold/products_scaffold.dart';
import '../../../core/widget/product_map_list.dart';
import '../../../utils/dbhelper.dart';
import '../../model/products.dart';

class CigarettesList extends StatefulWidget {
  @override
  _CigarettesListState createState() => _CigarettesListState();
}

class _CigarettesListState extends State<CigarettesList> {
  late DatabaseHelper databaseHelper;
  late List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>.empty(growable: true);
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
    return buildProductsScaffold(
      "CIGARETTES",
      ListView(
        physics: BouncingScrollPhysics(),
        children: foodItemCreat(context, allFoodList),
      ),
    );
  }
}
