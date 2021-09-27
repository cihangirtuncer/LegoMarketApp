import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildAppBarText(String letter, Color colors, double fontsize) {
  return Text(
    letter,
    style: TextStyle(
      color: colors,
      fontSize: fontsize,
    ),
  );
}
