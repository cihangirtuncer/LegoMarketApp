import 'package:flutter/material.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

// ignore: non_constant_identifier_names
BuildProductsScaffold(String productName, ListView listView) {
  return Scaffold(
    appBar: MainAppBar(
        Text(
          productName,
        ),
        true),
    body: listView,
  );
}
