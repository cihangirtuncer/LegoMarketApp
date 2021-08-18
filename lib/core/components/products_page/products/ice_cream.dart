import 'package:flutter/material.dart';

class IcreCreamList extends StatefulWidget {
  IcreCreamList({Key? key}) : super(key: key);

  @override
  _IcreCreamListState createState() => _IcreCreamListState();
}

class _IcreCreamListState extends State<IcreCreamList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Ice Cream"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
