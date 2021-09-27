import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildAppBar(String name) {
  return AppBar(
    backgroundColor: Colors.indigo.shade900,
    automaticallyImplyLeading: false,
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
