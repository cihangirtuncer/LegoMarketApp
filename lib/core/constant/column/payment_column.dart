import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/botton/payment_icon_button.dart';

// ignore: non_constant_identifier_names
BuildPaymentColumn(String price, String name, String explanation) {
  return Column(
    children: [
      Container(
        width: 300,
        height: 500,
        child: Row(
          children: [
            /*ListTile(
              title: Text(name),
              subtitle: Text(explanation),
            )*/
          ],
        ),
      ),
      Container(
        child: Row(
          children: [
            ButtonPayment(),
            Text(price),
          ],
        ),
      )
    ],
  );
}
