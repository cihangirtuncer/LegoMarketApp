import 'package:flutter/material.dart';

import '../../components/text/appbar_text.dart';

// ignore: non_constant_identifier_names
Widget BuildHomeAppBarText(double fontsize, double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      BuildAppBarText("L", Colors.red, fontsize),
      BuildAppBarText("E", Colors.orange, fontsize),
      BuildAppBarText("G", Colors.yellow, fontsize),
      BuildAppBarText("O", Colors.green, fontsize),
      SizedBox(
        width: width,
      ),
      BuildAppBarText("M", Colors.red, fontsize),
      BuildAppBarText("A", Colors.orange, fontsize),
      BuildAppBarText("R", Colors.yellow, fontsize),
      BuildAppBarText("K", Colors.green, fontsize),
      BuildAppBarText("E", Colors.blue.shade400, fontsize),
      BuildAppBarText("T", Colors.pink.shade300, fontsize),
    ],
  );
}
