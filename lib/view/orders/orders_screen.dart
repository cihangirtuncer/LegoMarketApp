import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/orders_page/build_orders_screen.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return BuildOrdersScreen();
  }
}
