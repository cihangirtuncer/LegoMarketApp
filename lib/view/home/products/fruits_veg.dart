import 'package:flutter/material.dart';

class FruitsVeg extends StatefulWidget {
  FruitsVeg({Key key}) : super(key: key);

  @override
  _FruitsVegState createState() => _FruitsVegState();
}

class _FruitsVegState extends State<FruitsVeg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits & Veg"),
      ),
      body: Container(),
    );
  }
}
