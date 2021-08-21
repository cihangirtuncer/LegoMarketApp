import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class SexualHealthList extends StatefulWidget {
  SexualHealthList({Key? key}) : super(key: key);

  @override
  _SexualHealthListState createState() => _SexualHealthListState();
}

class _SexualHealthListState extends State<SexualHealthList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "SEXUAL HEALTH",
      ListView(
        children: [],
      ),
    );
  }
}
