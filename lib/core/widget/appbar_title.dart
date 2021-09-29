import 'package:flutter/material.dart';

import '../components/text/appbar_text.dart';

// ignore: non_constant_identifier_names
Widget BuildHomeAppBarText(double fontsize, double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      BuildAppBarText("L", Color(0xFFFFDA08), fontsize),
      BuildAppBarText("E", Color(0xFF030596), fontsize),
      BuildAppBarText("G", Color(0xFF01A517), fontsize), //Color(0xFF0011FF),
      BuildAppBarText("O", Color(0xFF9B0C53), fontsize),
      SizedBox(
        width: width,
      ),
      BuildAppBarText("M", Color(0xF5D9FF00), fontsize),
      BuildAppBarText("A", Color(0xF5FF006A), fontsize),
      BuildAppBarText("R", Color(0xFF0112FF), fontsize),
      BuildAppBarText("K", Color(0xF5C000A0), fontsize),
      BuildAppBarText("E", Color(0xF5FF000D), fontsize),
      BuildAppBarText("T", Color(0xFFFBFF09), fontsize),
    ],
  );
}
