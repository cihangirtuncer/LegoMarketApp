import 'package:flutter/material.dart';
import '../../widget/color.dart';

import '../icon/standart_icon.dart';

buildProfileRow(String string, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildStandartIcon(
          icon,
          buildColor(),
        ),
        Text("         "),
        Expanded(
          child: Text(
            string,
            style: TextStyle(
              fontSize: 21,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
