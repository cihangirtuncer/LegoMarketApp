import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/divider/profile_divder.dart';
import 'package:lego_market_app/core/components/text/orders_card_text.dart';
import 'package:lego_market_app/core/widget/gradient_container.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _OrdersScreenState extends State<OrdersScreen> {
  String totalPrice = 0.toString();
  final _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid.toString())
      .collection('orders')
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
      ),
      body: BuildGradientContainer(
        Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                if (asyncSnapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 270, 0, 0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                if (!asyncSnapshot.data!.docs.isNotEmpty ||
                    !asyncSnapshot.hasData)
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.feedback,
                          size: 60,
                          color: Colors.white,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                            child: Text(
                              'There are no items to display in your basket.',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );

                List<DocumentSnapshot> listofDocumentSnap =
                    asyncSnapshot.data!.docs;

                return Flexible(
                  child: ListView.builder(
                    itemCount: listofDocumentSnap.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BuildOrdersCardTextWidget(
                                        "Product Name: ",
                                        '${listofDocumentSnap[index]['name']}',
                                      ),
                                      BuildProfileDivider(8),
                                      BuildOrdersCardTextWidget(
                                        "Price: ",
                                        "${listofDocumentSnap[index]['price']} €",
                                      ),
                                      BuildProfileDivider(8),
                                      BuildOrdersCardTextWidget(
                                        "Count: ",
                                        "${listofDocumentSnap[index]['volume']}",
                                      ),
                                      BuildProfileDivider(8),
                                    ],
                                  ),
                                  content: BuildOrdersCardTextWidget(
                                    "Explanation: ",
                                    '${listofDocumentSnap[index]['explanation']}',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        final firestore =
                                            FirebaseFirestore.instance;
                                        CollectionReference usersRef =
                                            firestore.collection('users');
                                        await usersRef
                                            .doc(_auth.currentUser!.uid
                                                .toString())
                                            .collection('orders')
                                            .doc(
                                                '${listofDocumentSnap[index]['name']}')
                                            .delete();
                                        Navigator.pop(
                                          context,
                                          'DELETE',
                                        );
                                      },
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
                                    '${listofDocumentSnap[index]['name']}',
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
