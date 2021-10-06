import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/text/orders_card_text.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _OrdersScreenState extends State<OrdersScreen> {
  final _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid.toString())
      .collection('orders')
      .doc('personalorders')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
          Text(
            "Orders",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          false),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _usersStream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          DocumentSnapshot<Object?> data = snapshot.data!;

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
                              "Product Name: ", data['name']),
                          BuildOrdersCardTextWidget(
                            "Price: ",
                            data['price'].toString() + " €",
                          ),
                          BuildOrdersCardTextWidget(
                            "count: ",
                            "1",
                          ),
                        ],
                      ),
                      content: BuildOrdersCardTextWidget(
                        "Explanation: ",
                        data['explanation'],
                      ),
                      actions: [
                        TextButton(
                          //FirebaseFirestore Problem
                          onPressed: () {},
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
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                        title: Text(
                          data['name'],
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
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
