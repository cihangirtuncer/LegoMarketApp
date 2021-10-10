import 'package:flutter/material.dart';

buildInfoContainer(BuildContext context, Widget child) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.38,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white10,
      border:
          Border.all(width: 2.0, color: Colors.white, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    ),
  );
}
