import 'package:flutter/material.dart';

class TechnologyList extends StatefulWidget {
  TechnologyList({Key? key}) : super(key: key);

  @override
  _TechnologyListState createState() => _TechnologyListState();
}

class _TechnologyListState extends State<TechnologyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Technology"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
