import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class TechnologyList extends StatefulWidget {
  TechnologyList({Key? key}) : super(key: key);

  @override
  _TechnologyListState createState() => _TechnologyListState();
}

class _TechnologyListState extends State<TechnologyList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "TECHNOLOGY",
      ListView(
        children: [],
      ),
    );
  }
}
