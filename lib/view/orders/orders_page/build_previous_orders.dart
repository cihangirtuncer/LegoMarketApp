import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/card/previous_orders_card.dart';

// ignore: non_constant_identifier_names
BuildPreviousOrders(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [BuildPreviousOrdersCard("Fetucini Alfredo")],
  );
}
