import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/divider/profile_divder.dart';
import '../../../core/components/text/orders_card_text.dart';
import '../../../core/widget/gradient_container.dart';
import '../../../core/widget/info_container.dart';
import '../../../core/widget/main_appBar.dart';
import '../../../core/widget/price_counter.dart';
import 'checkout_screen.dart';

class BasketScreen extends StatefulWidget {
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _BasketScreenState extends State<BasketScreen> {
  final _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid.toString())
      .collection('basket')
      .snapshots();

  final Color whiteColor = Colors.white;
  final Color indigoColor = Colors.indigo.shade900;
  final Color green700Color = Colors.green.shade700;
  final Color red700Color = Colors.red.shade700;
  final Color redColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: mainAppBar(
        Text(
          "Basket",
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
                  color: redColor,
                ),
                title: "Are you sure you want to empty your basket?",
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      final firestore = FirebaseFirestore.instance;
                      CollectionReference usersRef =
                          firestore.collection('users');
                      var snapshot = await usersRef
                          .doc(_auth.currentUser!.uid.toString())
                          .collection('basket')
                          .get();
                      var snapshots = await usersRef
                          .doc(_auth.currentUser!.uid.toString())
                          .collection('orders')
                          .get();
                      if (snapshots.docs.isNotEmpty) {
                        for (var doc in snapshots.docs) {
                          await doc.reference.delete();
                        }
                      }
                      if (snapshot.docs.isNotEmpty) {
                        for (var doc in snapshot.docs) {
                          await doc.reference.delete();
                        }
                      }

                      Get.back();
                    },
                    child: Text('DELETE'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        red700Color,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text('CANCEL'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        green700Color,
                      ),
                    ),
                  ),
                ],
              );
            }),
            icon: Icon(
              Icons.delete_sharp,
              size: 34,
            ),
          )
        ],
      ),
      body: buildGradientContainer(
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
                        color: redColor,
                      ),
                    ),
                  );
                }
                if (!asyncSnapshot.data!.docs.isNotEmpty ||
                    !asyncSnapshot.hasData) return emptyBasket(context);

                List<DocumentSnapshot> listofDocumentSnap =
                    asyncSnapshot.data!.docs;

                return Column(
                  children: [
                    Container(
                      height: screenHeight * 0.70,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: listofDocumentSnap.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.defaultDialog(
                                title: 'ORDER',
                                content: defaultDialogContentColumn(
                                  listofDocumentSnap,
                                  index,
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      String docName =
                                          "${listofDocumentSnap[index]['name']} ${listofDocumentSnap[index]['date']}";
                                      final firestore =
                                          FirebaseFirestore.instance;
                                      CollectionReference usersRef =
                                          firestore.collection('users');
                                      await usersRef
                                          .doc(
                                              _auth.currentUser!.uid.toString())
                                          .collection('basket')
                                          .doc(docName)
                                          .delete();
                                      await usersRef
                                          .doc(
                                              _auth.currentUser!.uid.toString())
                                          .collection('orders')
                                          .doc(docName)
                                          .delete();

                                      Get.back();
                                    },
                                    child: Text('DELETE'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        red700Color,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Get.back(),
                                    child: Text('CANCEL'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        green700Color,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            child: basketCard(listofDocumentSnap, index),
                          );
                        },
                      ),
                    ),
                    basketPrice(screenHeight, screenWidth),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding emptyBasket(BuildContext context) {
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
              color: whiteColor,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Text(
                'There are no items to display in your basket.',
                style: TextStyle(
                  fontSize: 30,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column defaultDialogContentColumn(
      List<DocumentSnapshot<Object?>> listofDocumentSnap, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildOrdersCardTextWidget(
          "Product Name: ",
          '${listofDocumentSnap[index]['name']}',
        ),
        buildProfileDivider(8),
        buildOrdersCardTextWidget(
          "Price: ",
          "€${listofDocumentSnap[index]['price']}",
        ),
        buildProfileDivider(8),
        buildOrdersCardTextWidget(
          "Count: ",
          "${listofDocumentSnap[index]['volume']}",
        ),
        buildProfileDivider(8),
        buildOrdersCardTextWidget(
          "Explanation: ",
          '${listofDocumentSnap[index]['explanation']}',
        ),
      ],
    );
  }

  Align basketPrice(double screenHeight, double screenWidth) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: screenHeight * 0.077,
              color: green700Color,
              child: Align(
                alignment: Alignment(-0.55, 0.0),
                child: PriceCounter(),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                height: screenHeight * 0.077,
                width: screenWidth * 0.45,
                child: Align(
                  alignment: Alignment(0.1, 0.0),
                  child: Text(
                    "Confrim Basket",
                    style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Get.to(
                  () => CheckoutScreen(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding basketCard(
      List<DocumentSnapshot<Object?>> listofDocumentSnap, int index) {
    return Padding(
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
              color: indigoColor,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.red.shade100,
            child: Text(
              '${listofDocumentSnap[index]['volume']}',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: indigoColor,
              ),
            ),
          ),
          trailing: Text(
            '€${listofDocumentSnap[index]['price']}',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: indigoColor,
            ),
          ),
        ),
      ),
    );
  }
}
