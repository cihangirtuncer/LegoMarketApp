import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class PersonalCareList extends StatefulWidget {
  PersonalCareList({Key? key}) : super(key: key);

  @override
  _PersonalCareListState createState() => _PersonalCareListState();
}

class _PersonalCareListState extends State<PersonalCareList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "PERSONAL CARE",
      ListView(
        children: [],
      ),
    );
  }
}
