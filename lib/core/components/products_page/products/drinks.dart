import 'package:flutter/material.dart';

class DrinksList extends StatefulWidget {
  DrinksList({Key? key}) : super(key: key);

  @override
  _DrinksListState createState() => _DrinksListState();
}

class _DrinksListState extends State<DrinksList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Drinks"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
