import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/card/products_card.dart';

class FoodList extends StatefulWidget {
  FoodList({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Foods"),
      ),
      body: ListView(
        children: [
          BuildProductCard(
            "Fettucini Alfredo",
            "chicken,parmesan,cream",
            "25 TL",
            context,
          ),
          BuildProductCard(
            "Cheeseburger",
            "meat,onion,lettuce,cheese",
            "35 TL",
            context,
          )
        ],
      ),
    );
  }
}
