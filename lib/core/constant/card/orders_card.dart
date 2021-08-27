import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildOrdersCard(String ordersName) {
  return Card(
    child: ListTile(
        title: Text(
          ordersName,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          "continues",
          style: TextStyle(fontSize: 18, color: Colors.green.shade700),
        ),
        trailing: Icon(
          Icons.run_circle_outlined,
          color: Colors.green,
          size: 35,
        )),
  );
}
