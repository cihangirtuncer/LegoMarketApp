import 'package:flutter/material.dart';

class PersonalCareList extends StatefulWidget {
  PersonalCareList({Key? key}) : super(key: key);

  @override
  _PersonalCareListState createState() => _PersonalCareListState();
}

class _PersonalCareListState extends State<PersonalCareList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Personal Care"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
