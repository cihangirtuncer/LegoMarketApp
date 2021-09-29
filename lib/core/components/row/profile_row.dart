import 'package:flutter/material.dart';
import 'package:lego_market_app/core/widget/color.dart';

import '../icon/standart_icon.dart';

// ignore: non_constant_identifier_names
BuildProfileRow(String string, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      BuildStandartIcon(
        icon,
        BuildColor(),
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
