import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar MainAppBar(Widget? child) {
  return AppBar(
    centerTitle: true,
    title: child,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFFB60707),
            Color(0xFFE49E07),
            // Color(0xF504094E),
          ],
        ),
      ),
    ),
  );
}
