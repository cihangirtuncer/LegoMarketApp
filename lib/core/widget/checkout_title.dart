import 'package:flutter/material.dart';

buildCheckoutTitle(double width, String text) {
  return Container(
    width: width,
    color: Colors.grey.shade300,
    child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 19),
            ),
          ],
        )),
  );
}
