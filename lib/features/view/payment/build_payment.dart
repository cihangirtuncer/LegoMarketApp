import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/payment_product_counter.dart';

// ignore: non_constant_identifier_names
BuildPayment(BuildContext context, int price, String name, String explanation) {
  // ignore: unused_local_variable
  final firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // CollectionReference usersRef = firestore.collection('orders');

  return Scaffold(
    backgroundColor: Colors.grey.shade200,
    appBar: AppBar(
      title: Padding(
        padding: const EdgeInsets.fromLTRB(
          75,
          0,
          0,
          0,
        ),
        child: Text(
          "PAYMENT",
        ),
      ),
      backgroundColor: Colors.green.shade900,
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
            width: 110,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
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
            onPressed: () async {
              String nameNoSql = name;
              if (_auth.currentUser != null) {
                Map<String, dynamic> usersData = {
                  'price': price,
                  'explanation': explanation,
                  'name': nameNoSql,
                };
                User? name = _auth.currentUser;
                CollectionReference usersRef = firestore.collection('users');
                await usersRef
                    .doc(name!.uid.toString())
                    .collection('orders')
                    .doc('personalorders')
                    .set(usersData, SetOptions(merge: true));

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Product added to basket',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                );
              } else {
                AlertDialog(
                  title: Text('Please login'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(
                        context,
                        'Login',
                      ),
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                );
              }
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
        ),
      ],
    ),
  );
}
