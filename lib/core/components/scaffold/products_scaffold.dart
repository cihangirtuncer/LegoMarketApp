import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildProductsScaffold(String productName, ListView listView) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xF504094E),
      title: Text(
        productName,
      ),
    ),
    body: listView,
  );
}
