import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/orders_page/build_orders_screen.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return BuildOrdersScreen();
  }
}
