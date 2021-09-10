import 'package:flutter/material.dart';
import '../row/home_app_bar_row.dart';

// ignore: non_constant_identifier_names
AppBar HomeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue.shade900,
    title: BuildHomeAppBarText(),
    actions: [],
  );
}
