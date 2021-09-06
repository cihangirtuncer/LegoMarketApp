import 'package:flutter/material.dart';

class FitForm extends StatefulWidget {
  FitForm({Key key}) : super(key: key);

  @override
  _FitFormState createState() => _FitFormState();
}

class _FitFormState extends State<FitForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fit Form"),
      ),
      body: Container(),
    );
  }
}
