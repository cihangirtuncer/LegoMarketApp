import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/scaffold/orders_scaffold.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return OrdersAppBar();
  }
}
