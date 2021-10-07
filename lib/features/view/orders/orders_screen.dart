import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/text/orders_card_text.dart';
import 'package:lego_market_app/core/widget/color.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
bool? dataBool;

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
          false,
          actions: [
            IconButton(
                onPressed: () async {
                  final firestore = FirebaseFirestore.instance;
                  CollectionReference usersRef = firestore.collection('users');
                  await usersRef
                      .doc(_auth.currentUser!.uid.toString())
                      .collection('orders')
                      .doc('personalorders')
                      .delete();
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 30,
                ))
          ]),
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: _usersStream,
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 270, 0, 0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (!snapshot.data!.exists || !snapshot.hasData)
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 210, 0, 0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.feedback,
                        size: 60,
                        color: BuildColor(),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Text(
                            'There are no items to display in your basket.',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                );

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
                                "Product Name: ",
                                data['name'],
                              ),
                              BuildOrdersCardTextWidget(
                                "Price: ",
                                data['price'].toString() + " €",
                              ),
                              BuildOrdersCardTextWidget(
                                "count: ",
                                data['volume'].toString(),
                              ),
                            ],
                          ),
                          content: BuildOrdersCardTextWidget(
                            "Explanation: ",
                            data['explanation'],
                          ),
                          actions: [
                            TextButton(
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
        ],
      ),
    );
  }
}
