import 'package:flutter/material.dart';

buildOrdersCardTextWidget(String statickWord, String word) {
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
