import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/botton/payment_icon_button.dart';
import 'package:lego_market_app/models/products.dart';
import 'package:lego_market_app/utils/dbhelper.dart';

// ignore: non_constant_identifier_names
BuildPayment(BuildContext context, int price, String name, String explanation) {
  // ignore: unused_local_variable
  DatabaseHelper databaseHelper;
  return Scaffold(
    backgroundColor: Colors.grey.shade200,
    appBar: AppBar(
      title: Text("PAYMENT"),
      backgroundColor: Colors.green.shade700,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            width: 120,
            height: 110,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        explanation,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    price.toString() + " €",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: ButtonPayment(),
          ),
        ),
        Align(
          child: ElevatedButton(
            onPressed: () {
              //fail !!! problem
              databaseHelper
                  .addOrders(Products(
                    name,
                    price,
                    explanation,
                  ))
                  .then((value) => Navigator.pop(context));
            },
            child: Text(
              'Add to Basket',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.green.shade700,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
