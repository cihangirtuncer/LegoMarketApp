import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PriceCounter extends StatefulWidget {
  PriceCounter({Key? key}) : super(key: key);

  @override
  _PriceCounterState createState() => _PriceCounterState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _PriceCounterState extends State<PriceCounter> {
  final _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid.toString())
      .collection('orders')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;

    return StreamBuilder<QuerySnapshot>(
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
        List<DocumentSnapshot> listofDocumentSnap = asyncSnapshot.data!.docs;
        for (int i = 0; i < listofDocumentSnap.length; i++) {
          totalPrice =
              totalPrice + int.parse("${listofDocumentSnap[i]['price']}");
        }
        return Text(
          'Total: $totalPrice €',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
