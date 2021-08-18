import 'package:flutter/material.dart';

class CleaningProductList extends StatefulWidget {
  CleaningProductList({Key? key}) : super(key: key);

  @override
  _CleaningProductListState createState() => _CleaningProductListState();
}

class _CleaningProductListState extends State<CleaningProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Home Care"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
