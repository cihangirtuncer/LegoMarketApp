import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildOrdersCardTextWidget(String statickWord, String word) {
  return Row(
    children: [
      Expanded(
        child: Text(
          "$statickWord",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      Expanded(
        child: Text(
          "$word",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
