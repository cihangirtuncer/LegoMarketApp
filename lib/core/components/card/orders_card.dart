import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Column BuildOrdersCard(
  BuildContext context,
  String name,
  String explanation,
  int price,
) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: $name',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Price: $price €',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Count: 1',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              content: Text(
                'Explanation: $explanation',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(
                    context,
                    'Cancel',
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
