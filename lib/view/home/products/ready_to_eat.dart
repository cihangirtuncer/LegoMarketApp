import 'package:flutter/material.dart';

class ReadyToEat extends StatefulWidget {
  ReadyToEat({Key key}) : super(key: key);

  @override
  _ReadyToEatState createState() => _ReadyToEatState();
}

class _ReadyToEatState extends State<ReadyToEat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ready To Eat"),
      ),
      body: Container(),
    );
  }
}
