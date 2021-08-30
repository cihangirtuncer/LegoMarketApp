import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/card/products_card.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';
import 'package:lego_market_app/models/orders.dart';
import 'package:lego_market_app/utils/dbhelper.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  // ignore: unused_field
  DatabaseHelper _databaseHelper;
  List<Orders> allFoodList;
  @override
  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Orders>();
    _databaseHelper = DatabaseHelper();
    _databaseHelper.allProduct().then((allFoodMapList) {
      for (Map okunanOrdersMapi in allFoodMapList) {
        // bu for döngüsü bittiğinde veri yabanında bulunan bütün orderslar olucak allFoodList listemde
        allFoodList.add(Orders.fromMap(okunanOrdersMapi));
      }
    }).catchError((error) => print("error" + error));
  }

  Widget build(BuildContext context) {
    return BuildProductsScaffold(
        "FOODS",
        ListView.builder(
            itemCount: allFoodList.length,
            itemBuilder: (context, index) {
              return BuildProductCard(
                allFoodList[index].name,
                allFoodList[index].explanation,
                allFoodList[index].price.toString(),
                context,
              );
            }));
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
