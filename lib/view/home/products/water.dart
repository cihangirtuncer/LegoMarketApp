import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class WaterList extends StatefulWidget {
  @override
  _WaterListState createState() => _WaterListState();
}

class _WaterListState extends State<WaterList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "WATER",
      ListView(
        children: [],
      ),
    );
  }
}
