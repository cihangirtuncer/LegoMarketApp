import 'package:flutter/material.dart';
import 'package:lego_market_app/product/model/products.dart';
import '../../../core/widget/product_map_list.dart';
import '../../../utils/dbhelper.dart';
import '../../../../core/components/scaffold/products_scaffold.dart';

class HomeLivingList extends StatefulWidget {
  HomeLivingList({Key? key}) : super(key: key);

  @override
  _HomeLivingListState createState() => _HomeLivingListState();
}

class _HomeLivingListState extends State<HomeLivingList> {
  late DatabaseHelper databaseHelper;
  late List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>.empty(growable: true);
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
    return buildProductsScaffold(
      "HOME LIVING",
      foodItemCreat(context, allFoodList),
    );
  }
}
