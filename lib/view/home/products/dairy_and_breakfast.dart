import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class DairyAndBreakfastList extends StatefulWidget {
  DairyAndBreakfastList({Key? key}) : super(key: key);

  @override
  _DairyAndBreakfastListState createState() => _DairyAndBreakfastListState();
}

class _DairyAndBreakfastListState extends State<DairyAndBreakfastList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "DAIRY & BREKFAST",
      ListView(
        children: [],
      ),
    );
  }
}
