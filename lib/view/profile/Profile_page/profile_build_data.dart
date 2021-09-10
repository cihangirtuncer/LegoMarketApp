import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildProfileData(
  Color color,
  double width,
  double height,
  AlignmentGeometry widgetAlignment,
  Widget widget,
) {
  return Padding(
    padding: EdgeInsets.all(7.0),
    child: Container(
      alignment: widgetAlignment,
      width: width,
      height: height,
      child: widget,
      decoration: BoxDecoration(
        color: color,
      ),
    ),
  );
}
