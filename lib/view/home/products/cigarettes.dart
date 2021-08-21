import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';

class CigarettesList extends StatefulWidget {
  CigarettesList({Key? key}) : super(key: key);

  @override
  _CigarettesListState createState() => _CigarettesListState();
}

class _CigarettesListState extends State<CigarettesList> {
  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "CIGARETTES",
      ListView(
        children: [],
      ),
    );
  }
}
