import 'package:flutter/material.dart';
import '../text/orders_card_text.dart';
import '../../../utils/dbhelper.dart';
import '../../../utils/dbhelper.dart';

// ignore: non_constant_identifier_names
Column BuildOrdersCard(
  BuildContext context,
  String name,
  String explanation,
  int price,
  int id,
) {
  // ignore: unused_local_variable
  DatabaseHelper databaseHelper;

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
                  BuildOrdersCardTextWidget(
                    "Product Name: ",
                    "$name",
                  ),
                  BuildOrdersCardTextWidget(
                    "Price: ",
                    "$price €",
                  ),
                  BuildOrdersCardTextWidget(
                    "count: ",
                    "1",
                  ),
                ],
              ),
              content: BuildOrdersCardTextWidget(
                "Explanation: ",
                "$explanation",
              ),
              actions: [
                TextButton(
                  //FirebaseFirestore Problem
                  onPressed: () {
                    databaseHelper.delete(
                      'Orders',
                      id,
                    );
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(
                    context,
                    'OK',
                  ),
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
