import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildProfileRow(String string, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        icon,
        color: Colors.blue.shade900,
      ),
      Text(" "),
      Text(
        string,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    ],
  );
}
