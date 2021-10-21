import 'package:flutter/material.dart';

import '../components/text/appbar_text.dart';

// ignore: non_constant_identifier_names
Widget BuildHomeAppBarText(double fontsize, double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      BuildAppBarText(
        "LEGO MA",
        Colors.white,
        fontsize,
      ),
      BuildAppBarText(
        "R",
        Colors.white,
        fontsize,
      ),
      BuildAppBarText(
        "K",
        Colors.white,
        fontsize,
      ),
      BuildAppBarText(
        "E",
        Colors.white,
        fontsize,
      ),
      BuildAppBarText(
        "T",
        Colors.white,
        fontsize,
      ),
    ],
  );
}
