import 'package:flutter/material.dart';
import 'package:lego_market_app/features/model/products.dart';
import 'package:lego_market_app/features/view/home/home_page/product_list.dart';
import 'package:lego_market_app/utils/dbhelper.dart';
import '../../../../core/components/scaffold/products_scaffold.dart';

class PetFoodList extends StatefulWidget {
  PetFoodList({Key key}) : super(key: key);

  @override
  _PetFoodListState createState() => _PetFoodListState();
}

class _PetFoodListState extends State<PetFoodList> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Petfood").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "PET FOOD",
      ListView(
        children: foodItemCreat(),
      ),
    );
  }

// ignore: missing_return
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
