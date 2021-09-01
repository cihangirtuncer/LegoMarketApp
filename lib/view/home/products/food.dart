import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/card/products_card.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';
import 'package:lego_market_app/models/foods.dart';
import 'package:lego_market_app/utils/dbhelper.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  DatabaseHelper databaseHelper;
  List<Foods> allFoodList;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Foods>();
    databaseHelper = DatabaseHelper();
    databaseHelper.foodsFetch().then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Foods.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "FOODS",
      ListView(
        children: [DropdownButton(items: foodItemCreat())],
      ),
    );
  }

// ignore: missing_return
  List<DropdownMenuItem<int>> foodItemCreat() {
    return allFoodList
        .map((foods) =>
            DropdownMenuItem<int>(value: foods.id, child: Text(foods.name)))
        .toList();
  }
}

/*




BuildProductCard(
              "Fettucini Alfredo",
              "chicken,parmesan,cream",
              "30 TL",
              context,
            ),
            BuildProductCard(
              "Cheeseburger",
              "meat,onion,lettuce,cheese",
              "35 TL",
              context,
            ),
            BuildProductCard(
              "Pizza Italiona",
              "ricotta cheese,basil,olive",
              "45 TL",
              context,
            ),
            BuildProductCard(
              "Endulus Chicken",
              "chicken,spicy",
              "40 TL",
              context,
            )
*/
