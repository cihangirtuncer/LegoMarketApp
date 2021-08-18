import 'package:flutter/material.dart';

class BasicFood extends StatefulWidget {
  BasicFood({Key? key}) : super(key: key);

  @override
  _BasicFoodState createState() => _BasicFoodState();
}

class _BasicFoodState extends State<BasicFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Basic Food"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
