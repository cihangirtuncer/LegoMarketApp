import 'package:flutter/material.dart';
import 'package:lego_market_app/core/widget/list_map/product_list_map.dart';
import 'package:lego_market_app/features/model/products.dart';
import 'package:lego_market_app/features/view/home/home_page/product_list.dart';
import 'package:lego_market_app/utils/dbhelper.dart';
import '../../../../core/components/scaffold/products_scaffold.dart';

class ReadyToEatList extends StatefulWidget {
  ReadyToEatList({Key key}) : super(key: key);

  @override
  _ReadyToEatListState createState() => _ReadyToEatListState();
}

class _ReadyToEatListState extends State<ReadyToEatList> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Readytoeat").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "READ to EAT ",
      ListView(
        children: foodItemCreat(context, allFoodList),
      ),
    );
  }
}
