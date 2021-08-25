import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildPreviousOrders(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Card(
        child: ListTile(
          title: Text(
            "Fetucini Alfredo",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            "chicken,parmesan,cream",
            style: TextStyle(fontSize: 18),
          ),
          trailing: Text(
            "30",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    ],
  );
}
