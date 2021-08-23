import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/icon/bottom_icon.dart';

// ignore: non_constant_identifier_names
BuildProfileRow(String string, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      BuildStandartIcon(icon),
      Text(" "),
      Text(
        string,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    ],
  );
}
