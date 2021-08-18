import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/appBar/main_appbar.dart';

class MyOrders extends StatefulWidget {
  MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar("Orders"),
      body: Container(),
    );
  }
}
