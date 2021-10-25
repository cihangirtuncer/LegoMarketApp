import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/components/divider/profile_divder.dart';
import '../../../core/components/text/orders_card_text.dart';
import '../../../core/widget/gradient_container.dart';
import '../../../core/widget/info_container.dart';
import '../../../core/widget/main_appBar.dart';
import 'package:get/get.dart';

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
            onPressed: (() async {
              Get.defaultDialog(
                content: Icon(
                  Icons.warning,
                  size: 40,
                  color: Colors.red,
                ),
                title: "Are you sure you want to empty your basket?",
                textCancel: 'DELETE',
                cancelTextColor: Colors.red,
                onCancel: () async {
                  final firestore = FirebaseFirestore.instance;
                  CollectionReference usersRef = firestore.collection('users');
                  var snapshot = await usersRef
                      .doc(_auth.currentUser!.uid.toString())
                      .collection('orders')
                      .get();
                  if (snapshot.docs.isNotEmpty) {
                    for (var doc in snapshot.docs) {
                      await doc.reference.delete();
                    }
                  }
                  Get.back();
                },
                textConfirm: 'OK',
                buttonColor: Colors.green,
                confirmTextColor: Colors.white,
                onConfirm: () => Get.back(),
              );
            }),
            icon: Icon(
              Icons.delete_sharp,
              size: 34,
            ),
          )
        ],
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
                    padding: const EdgeInsets.fromLTRB(5, 130, 5, 160),
                    child: buildInfoContainer(
                      context,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.feedback,
                            size: 80,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                            child: Text(
                              'There are no items to display in your basket.',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                List<DocumentSnapshot> listofDocumentSnap =
                    asyncSnapshot.data!.docs;

                return Flexible(
                  child: ListView.builder(
                    itemCount: listofDocumentSnap.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            title: 'ORDER',
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                BuildOrdersCardTextWidget(
                                  "Explanation: ",
                                  '${listofDocumentSnap[index]['explanation']}',
                                ),
                              ],
                            ),
                            textCancel: 'DELETE',
                            cancelTextColor: Colors.red,
                            onCancel: () async {
                              final firestore = FirebaseFirestore.instance;
                              CollectionReference usersRef =
                                  firestore.collection('users');
                              await usersRef
                                  .doc(_auth.currentUser!.uid.toString())
                                  .collection('orders')
                                  .doc('${listofDocumentSnap[index]['name']}')
                                  .delete();

                              Get.back();
                            },
                            textConfirm: 'OK',
                            buttonColor: Colors.green,
                            confirmTextColor: Colors.white,
                            onConfirm: () => Get.back(),
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
