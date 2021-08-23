import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/row/home_app_bar_row.dart';

// ignore: non_constant_identifier_names
AppBar HomeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue.shade900,
    title: BuildHomeAppBarText(),
    actions: [],
  );
}
