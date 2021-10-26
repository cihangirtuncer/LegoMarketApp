import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/view/payment/build_payment.dart';

// ignore: non_constant_identifier_names
BuildProgductCard(
    String name, String explanation, int price, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Get.to(
        () => buildPayment(
          context,
          price,
          name,
          explanation,
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
