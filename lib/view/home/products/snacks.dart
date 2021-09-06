import 'package:flutter/material.dart';

class Snacks extends StatefulWidget {
  Snacks({Key key}) : super(key: key);

  @override
  _SnacksState createState() => _SnacksState();
}

class _SnacksState extends State<Snacks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snacks"),
      ),
      body: Container(),
    );
  }
}
