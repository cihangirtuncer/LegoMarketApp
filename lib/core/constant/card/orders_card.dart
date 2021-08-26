import 'package:flutter/material.dart';

BuildOrdersCard(String ordersName) {
  return Card(
    child: ListTile(
      title: Text(
        ordersName,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(
        "continoue",
        style: TextStyle(fontSize: 18, color: Colors.green.shade700),
      ),
      trailing: Text(
        "30 TL",
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}
