import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/authenticate/login/login_view.dart';

int volume = 1;
int totalPrice = 0;

class ButtonPayment extends StatefulWidget {
  @override
  _ButtonPaymentState createState() => _ButtonPaymentState();
}

class _ButtonPaymentState extends State<ButtonPayment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.remove_outlined,
          ),
          onPressed: () {
            if (volume > 1) {
              setState(
                () {
                  volume -= 1;
                },
              );
            }
          },
        ),
        Text(
          "total: $volume",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.add_outlined,
          ),
          onPressed: () {
            setState(() {
              volume += 1;
            });
          },
        ),
      ],
    );
  }
}

// ignore: non_constant_identifier_names
BuildPayment(BuildContext context, int price, String name, String explanation) {
  // ignore: unused_local_variable
  final firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // CollectionReference usersRef = firestore.collection('orders');

  return Scaffold(
    backgroundColor: Colors.green.shade100,
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        "PAYMENT",
      ),
      backgroundColor: Colors.green.shade900,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.grey.shade100,
            ),
            width: 90,
            height: 220,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 35, 7, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Name: " + name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Explanation: " + explanation,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 5, 205, 0),
                    child: Text(
                      "Price: " + price.toString() + " €",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ButtonPayment(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 350, 10, 10),
            child: ElevatedButton(
              onPressed: () async {
                price = price * volume;
                totalPrice = totalPrice + price;

                String nameNoSql = name;
                if (_auth.currentUser != null) {
                  Map<String, dynamic> usersData = {
                    'price': price,
                    'explanation': explanation,
                    'name': nameNoSql,
                    'volume': volume,
                  };

                  User? name = _auth.currentUser;
                  CollectionReference usersRef = firestore.collection('users');
                  await usersRef
                      .doc(name!.uid.toString())
                      .collection('orders')
                      .doc(nameNoSql)
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
                    title: Text(
                        'You must register to add the product to the basket.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                Navigator.pop(context);
              },
              child: Text(
                'Add to Basket',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.green.shade700,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

totalPrices() async {
  return totalPrice;
}
