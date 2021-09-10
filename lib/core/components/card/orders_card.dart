import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Column BuildOrdersCard(
  BuildContext context,
  String name,
) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {},
        child: Card(
          child: ListTile(
              title: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "continues",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.amber.shade700,
                ),
              ),
              trailing: Icon(
                Icons.run_circle_outlined,
                color: Colors.amber.shade700,
                size: 35,
              )),
        ),
      )
    ],
  );
}
