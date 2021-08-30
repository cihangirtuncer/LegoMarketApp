import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class BasicFood extends StatefulWidget {
  @override
  _BasicFoodState createState() => _BasicFoodState();
}

class _BasicFoodState extends State<BasicFood> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "BASIC FOOD",
      ListView(
        children: [],
      ),
    );
  }
}
