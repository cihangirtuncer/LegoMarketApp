import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildAppBar(String name, bool whichTF) {
  return AppBar(
    backgroundColor: Color(0xF504094E),
    automaticallyImplyLeading: whichTF,
    title: Center(
      child: Text(
        name,
        style: TextStyle(
          fontSize: 23,
        ),
      ),
    ),
  );
}
