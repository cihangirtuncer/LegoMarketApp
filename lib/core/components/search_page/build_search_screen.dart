import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/app_bar/main_app_bar.dart';
import 'package:lego_market_app/utils/dbhelper.dart';

class BuildSearchScreen extends StatefulWidget {
  BuildSearchScreen({Key? key}) : super(key: key);

  @override
  _BuildSearchScreenState createState() => _BuildSearchScreenState();
}

class _BuildSearchScreenState extends State<BuildSearchScreen> {
  final dbHelper = DatabaseHelper.order;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BuildAppBar("Search"),
        body: Column(
          children: [
            Container(
              child: TextField(
                controller: queryController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "product name"),
              ),
            )
          ],
        ));
  }
}
/*
Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.start,
                decoration: const InputDecoration(
                  hintText: 'search for product',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text(
                  'Search',
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue.shade800),
                ),
              ),
            ),
          ],
        ),
      ),
      */