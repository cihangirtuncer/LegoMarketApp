import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class CleaningProductList extends StatefulWidget {
  @override
  _CleaningProductListState createState() => _CleaningProductListState();
}

class _CleaningProductListState extends State<CleaningProductList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "HOME CARE",
      ListView(
        children: [],
      ),
    );
  }
}
