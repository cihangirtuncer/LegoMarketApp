import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/card/orders_card.dart';

// ignore: non_constant_identifier_names
BuildOrders(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      BuildOrdersCard("Fetucini Alfredo"),
      BuildOrdersCard("Endulus Chicken"),
    ],
  );
}
