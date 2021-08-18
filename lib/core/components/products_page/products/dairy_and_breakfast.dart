import 'package:flutter/material.dart';

class DairyAndBreakfastList extends StatefulWidget {
  DairyAndBreakfastList({Key? key}) : super(key: key);

  @override
  _DairyAndBreakfastListState createState() => _DairyAndBreakfastListState();
}

class _DairyAndBreakfastListState extends State<DairyAndBreakfastList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Dairy and Breakfast"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
