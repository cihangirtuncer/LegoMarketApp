import 'package:flutter/material.dart';

BuildPreviousOrdersCard(String ordersName) {
  return Card(
    child: ListTile(
      title: Text(
        ordersName,
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
      leading: Text("arrived"),
    ),
  );
}
