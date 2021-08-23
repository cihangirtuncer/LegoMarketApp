import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildProfileData(
  Color color,
  double value,
  double width,
  double height,
  AlignmentGeometry widgetAlignment,
  Widget widget,
) {
  return Padding(
    padding: EdgeInsets.all(value),
    child: Container(
      alignment: widgetAlignment,
      width: width,
      height: height,
      child: widget,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(12),
        color: color,
      ),
    ),
  );

  /* Padding(
    padding: EdgeInsets.all(8.0),
    child: widget,
  );*/
}
