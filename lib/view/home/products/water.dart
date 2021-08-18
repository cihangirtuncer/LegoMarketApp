import 'package:flutter/material.dart';

class WaterList extends StatefulWidget {
  WaterList({Key? key}) : super(key: key);

  @override
  _WaterListState createState() => _WaterListState();
}

class _WaterListState extends State<WaterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Waters"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
