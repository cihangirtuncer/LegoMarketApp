import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/app_bar/main_app_bar.dart';
import 'package:lego_market_app/models/products.dart';
import 'package:lego_market_app/utils/dbhelper.dart';

class BuildSearchScreen extends StatefulWidget {
  @override
  _BuildSearchScreenState createState() => _BuildSearchScreenState();
}

class _BuildSearchScreenState extends State<BuildSearchScreen> {
  final dbHelper = DatabaseHelper;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController queryController = TextEditingController();
  List<Products> ordersByName = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BuildAppBar("Search"),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: queryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "product name",
                ),
                onChanged: (text) {
                  if (text.length >= 2) {
                    setState(() {});
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
                    margin: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                          '[${ordersByName[index].id}] ${ordersByName[index].name} ${ordersByName[index].explanation} ${ordersByName[index].price}'),
                    ),
                  );
                },
                itemCount: ordersByName.length,
                padding: const EdgeInsets.all(2),
              ),
            )
          ],
        ));
  }
}
