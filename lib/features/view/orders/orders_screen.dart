import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/gradient_container.dart';
import '../../../core/widget/info_container.dart';
import '../../../core/widget/main_appBar.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({Key? key}) : super(key: key);

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

  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarExtMeth(),
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
                  return circularProgressExtMeth();
                }
                if (!asyncSnapshot.data!.docs.isNotEmpty ||
                    !asyncSnapshot.hasData) return emptyOrdersExtMeth(context);

                List<DocumentSnapshot> listofDocumentSnap =
                    asyncSnapshot.data!.docs;

                return Column(
                  children: [
                    Container(
                      height: screenHeight * 0.84,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: listofDocumentSnap.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ordersProductContainerExtMeth(
                            screenHeight,
                            listofDocumentSnap,
                            index,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding ordersProductContainerExtMeth(double screenHeight,
      List<DocumentSnapshot<Object?>> listofDocumentSnap, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey.shade100,
        ),
        child: Center(
          child: ListTile(
            title: Text(
              '${listofDocumentSnap[index]['name']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'date:  ${listofDocumentSnap[index]['date']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              '${listofDocumentSnap[index]['price']} €',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade900,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.red.shade100,
              child: Text(
                '${listofDocumentSnap[index]['volume']}',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding emptyOrdersExtMeth(BuildContext context) {
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
                'There are no items to display in your orders.',
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
  }

  Padding circularProgressExtMeth() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 270, 0, 0),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }

  AppBar appBarExtMeth() {
    return mainAppBar(
      Text(
        "Orders",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      true,
    );
  }
}
