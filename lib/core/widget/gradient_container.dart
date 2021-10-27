import 'package:flutter/material.dart';

Widget buildGradientContainer(Widget widget) {
  return Container(
    width: 1000,
    height: 1000,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF8D0505),
          Color(0xFFE43307),
          Color(0xFFE49E07),
          Colors.teal,
          Color(0xFF040C7C),
          Color(0xF504094E),
          Color(0xF541012C),
        ],
      ),
    ),
    child: widget,
  );
}
