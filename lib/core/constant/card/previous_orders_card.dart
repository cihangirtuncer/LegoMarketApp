import 'package:flutter/material.dart';

BuildPreviousOrdersCard(String ordersName) {
  return Card(
    child: ListTile(
      title: Text(
        ordersName,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(
        "arrived",
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
      trailing: Text(
        "30 TL",
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}
