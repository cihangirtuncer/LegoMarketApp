import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildPreviousOrdersCard(String ordersName) {
  return Card(
    child: ListTile(
      title: Text(
        ordersName,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "delivered",
        style: TextStyle(
          fontSize: 18,
          color: Colors.green,
        ),
      ),
      trailing: Icon(
        Icons.room_service_outlined,
        color: Colors.green,
        size: 35,
      ),
    ),
  );
}
