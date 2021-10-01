import 'package:flutter/material.dart';

import '../components/text/appbar_text.dart';

// ignore: non_constant_identifier_names
Widget BuildHomeAppBarText(double fontsize, double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      BuildAppBarText("L", Colors.white, fontsize),
      BuildAppBarText("E", Colors.white, fontsize),
      BuildAppBarText("G", Colors.white, fontsize),
      BuildAppBarText("O", Colors.white, fontsize),
      SizedBox(
        width: width,
      ),
      BuildAppBarText("M", Colors.white, fontsize),
      BuildAppBarText("A", Colors.white, fontsize),
      BuildAppBarText("R", Colors.white, fontsize),
      BuildAppBarText("K", Colors.white, fontsize),
      BuildAppBarText("E", Colors.white, fontsize),
      BuildAppBarText("T", Colors.white, fontsize),
    ],
  );
}
