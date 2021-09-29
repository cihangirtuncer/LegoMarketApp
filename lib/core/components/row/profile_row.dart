import 'package:flutter/material.dart';

import '../icon/standart_icon.dart';

// ignore: non_constant_identifier_names
BuildProfileRow(String string, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      BuildStandartIcon(
        icon,
        Color(0xFF8D0505),
      ),
      Text(" "),
      Text(
        string,
        style: TextStyle(
          fontSize: 19,
        ),
      ),
    ],
  );
}
