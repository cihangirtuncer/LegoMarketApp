import 'package:flutter/material.dart';

class PetFood extends StatefulWidget {
  PetFood({Key key}) : super(key: key);

  @override
  _PetFoodState createState() => _PetFoodState();
}

class _PetFoodState extends State<PetFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Food"),
      ),
      body: Container(),
    );
  }
}
