import 'package:flutter/material.dart';

class HomeLiving extends StatefulWidget {
  HomeLiving({Key key}) : super(key: key);

  @override
  _HomeLivingState createState() => _HomeLivingState();
}

class _HomeLivingState extends State<HomeLiving> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Living"),
      ),
      body: Container(),
    );
  }
}
