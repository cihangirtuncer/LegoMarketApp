import 'package:flutter/material.dart';

buildCheckoutContainer(double width, double height, List<Widget> children) {
  return Container(
    width: width,
    height: height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}
