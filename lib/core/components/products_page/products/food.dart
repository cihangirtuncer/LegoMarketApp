import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  FoodList({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Foods"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
