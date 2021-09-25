import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildProductsScaffold(String productName, ListView listView) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.indigo.shade900,
      title: Text(
        productName,
      ),
    ),
    body: listView,
  );
}
