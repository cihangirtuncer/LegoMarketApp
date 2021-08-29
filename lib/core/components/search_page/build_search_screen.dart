import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/app_bar/main_app_bar.dart';
import 'package:lego_market_app/models/orders.dart';
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
  List<Orders> ordersByName = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BuildAppBar("Search"),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: queryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "product name",
                ),
                onChanged: (text) {
                  if (text.length >= 2) {
                    setState(() {
                      query(text);
                    });
                  } else {
                    ordersByName.clear();
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    margin: EdgeInsets.all(2),
                    child: Center(
                      child: Text(
                          '[${ordersByName[index].id}] ${ordersByName[index].name} ${ordersByName[index].explanation} ${ordersByName[index].price}'),
                    ),
                  );
                },
                itemCount: ordersByName.length,
                padding: const EdgeInsets.all(8),
              ),
            )
          ],
        ));
  }

  void query(String text) async {
    final allRows = await dbHelper.querRows(text);
    ordersByName.clear();
    allRows.forEach((row) => ordersByName.add(Orders.fromMap(row)));
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