import 'package:flutter/material.dart';

class SexualHealthList extends StatefulWidget {
  SexualHealthList({Key? key}) : super(key: key);

  @override
  _SexualHealthListState createState() => _SexualHealthListState();
}

class _SexualHealthListState extends State<SexualHealthList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Sexual Health"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
