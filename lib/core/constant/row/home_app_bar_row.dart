import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/text/appbar_text.dart';

// ignore: non_constant_identifier_names
Widget BuildHomeAppBarText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      BuildAppBarText(
        "L",
        Colors.red,
      ),
      BuildAppBarText(
        "E",
        Colors.orange,
      ),
      BuildAppBarText(
        "G",
        Colors.yellow,
      ),
      BuildAppBarText(
        "O",
        Colors.green,
      ),
      SizedBox(
        width: 10,
      ),
      BuildAppBarText(
        "M",
        Colors.red,
      ),
      BuildAppBarText(
        "A",
        Colors.orange,
      ),
      BuildAppBarText(
        "R",
        Colors.yellow,
      ),
      BuildAppBarText(
        "K",
        Colors.green,
      ),
      BuildAppBarText(
        "E",
        Colors.blue.shade400,
      ),
      BuildAppBarText(
        "T",
        Colors.pink.shade300,
      ),
    ],
  );
}
