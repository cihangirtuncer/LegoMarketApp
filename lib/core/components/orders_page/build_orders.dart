import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildOrders(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Card(
        child: ListTile(
          title: Text("Fetucini Alfredo"),
          subtitle: Text("chicken,parmesan,cream"),
          leading: Text("30"),
        ),
      ),
    ],
  );
}
