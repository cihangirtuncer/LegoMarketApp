import 'package:flutter/material.dart';
import '../../../core/components/payment_page/build_payment.dart';

// ignore: non_constant_identifier_names
Column BuildProductList(
  BuildContext context,
  String name,
  String explanation,
  int price,
) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuildPayment(
                context,
                price,
                name,
                explanation,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  explanation,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  price.toString() + " €",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
