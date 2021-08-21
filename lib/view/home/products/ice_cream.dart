import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class IcreCreamList extends StatefulWidget {
  IcreCreamList({Key? key}) : super(key: key);

  @override
  _IcreCreamListState createState() => _IcreCreamListState();
}

class _IcreCreamListState extends State<IcreCreamList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "ICE CREAM",
      ListView(
        children: [],
      ),
    );
  }
}
