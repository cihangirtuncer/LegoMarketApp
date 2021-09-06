import 'package:flutter/material.dart';

class BabyCare extends StatefulWidget {
  BabyCare({Key key}) : super(key: key);

  @override
  _BabyCareState createState() => _BabyCareState();
}

class _BabyCareState extends State<BabyCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Care"),
      ),
      body: Container(),
    );
  }
}
