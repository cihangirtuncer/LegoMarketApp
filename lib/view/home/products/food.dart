import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/card/products_card.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class FoodList extends StatefulWidget {
  FoodList({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
        "FOODS",
        ListView(
          children: [
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
          ],
        ));
  }
}
/*
Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Foods"
        ),
      ),
      body: ListView(
        children: [
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
          )
        ],
      ),
    );
*/