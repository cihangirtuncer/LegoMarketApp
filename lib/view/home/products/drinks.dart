import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class DrinksList extends StatefulWidget {
  DrinksList({Key? key}) : super(key: key);

  @override
  _DrinksListState createState() => _DrinksListState();
}

class _DrinksListState extends State<DrinksList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "DRINKS",
      ListView(
        children: [],
      ),
    );
  }
}
