import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/navigator/push.dart';
import 'package:lego_market_app/features/payment/build_payment.dart';

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
          navigatorPush(
            context,
            buildPayment(context, price, name, explanation),
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
              explanation,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Text(
              "€$price",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
