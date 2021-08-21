import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/payment_page/payment_column.dart';

// ignore: non_constant_identifier_names
BuildProductCard(
    String name, String explanation, String price, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BuildPayment(price, name, explanation)));
    },
    child: Column(
      children: [
        Card(
          child: ListTile(
            title: Text(
              name,
              style: TextStyle(fontSize: 19),
            ),
            subtitle: Text(
              explanation,
              style: TextStyle(fontSize: 15),
            ),
            trailing: Text(
              price,
              style: TextStyle(fontSize: 19),
            ),
          ),
        ),
      ],
    ),
  );
}
