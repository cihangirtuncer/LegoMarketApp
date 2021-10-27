import 'package:flutter/material.dart';

import '../../../../core/components/scaffold/products_scaffold.dart';
import '../../../core/widget/product_map_list.dart';
import '../../../utils/dbhelper.dart';
import '../../model/products.dart';

class PersonalCareList extends StatefulWidget {
  @override
  _PersonalCareListState createState() => _PersonalCareListState();
}

class _PersonalCareListState extends State<PersonalCareList> {
  late DatabaseHelper databaseHelper;
  late List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>.empty(growable: true);
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("PersonalCare").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildProductsScaffold(
      "PERSONAL CARE",
      ListView(
        physics: BouncingScrollPhysics(),
        children: foodItemCreat(context, allFoodList),
      ),
    );
  }
}
