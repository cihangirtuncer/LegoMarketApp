import 'package:flutter/material.dart';
import 'package:lego_market_app/features/view/payment/build_payment.dart';

// ignore: non_constant_identifier_names
BuildProductCard(
    String name, String explanation, int price, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BuildPayment(context, price, name, explanation),
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
              price.toString(),
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
