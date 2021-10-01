import 'package:flutter/material.dart';

import '../components/text/appbar_text.dart';

// ignore: non_constant_identifier_names
Widget BuildHomeAppBarText(double fontsize, double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      BuildAppBarText("L", Colors.yellow.shade600, fontsize),
      BuildAppBarText("E", Colors.yellow.shade600, fontsize),
      BuildAppBarText("G", Colors.yellow.shade600, fontsize),
      BuildAppBarText("O", Colors.yellow.shade600, fontsize),
      SizedBox(
        width: width,
      ),
      BuildAppBarText("M", Colors.yellow.shade600, fontsize),
      BuildAppBarText("A", Colors.yellow.shade600, fontsize),
      BuildAppBarText("R", Colors.yellow.shade600, fontsize),
      BuildAppBarText("K", Colors.yellow.shade600, fontsize),
      BuildAppBarText("E", Colors.yellow.shade600, fontsize),
      BuildAppBarText("T", Colors.yellow.shade600, fontsize),
    ],
  );
}
