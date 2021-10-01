import 'package:flutter/material.dart';

import '../components/text/appbar_text.dart';

// ignore: non_constant_identifier_names
Widget BuildHomeAppBarText(double fontsize, double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      BuildAppBarText("L", Color(0xF5FFFB0F), fontsize),
      BuildAppBarText("E", Color(0xFF0004FF), fontsize),
      BuildAppBarText("G", Color(0xFF00AD17), fontsize), //Color(0xFF0011FF),
      BuildAppBarText("O", Color(0xF5CE030D), fontsize), //0xF5FF000D
      SizedBox(
        width: width,
      ),
      BuildAppBarText("M", Color(0xFF0004FF), fontsize),
      BuildAppBarText("A", Color(0xF5FFFB0F), fontsize),
      BuildAppBarText("R", Color(0xFF00AD17), fontsize),
      BuildAppBarText("K", Colors.purple.shade600, fontsize),
      BuildAppBarText("E", Color(0xF5CE030D), fontsize),
      BuildAppBarText("T", Color(0xF5FFFB0F), fontsize),
    ],
  );
}
