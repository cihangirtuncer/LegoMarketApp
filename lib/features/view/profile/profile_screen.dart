import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/divider/profile_divder.dart';
import 'package:lego_market_app/core/components/row/profile_row.dart';
import 'package:lego_market_app/core/widget/color.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';
import 'package:path/path.dart';

import 'Profile_page/profile_build_data.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String nameSurname = "Cihangir Tuncer";
  late String phone = "0539*******";
  late String address = "Isparta";
  late String email = "Cihangirtuncer184@gmail.com";

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    CollectionReference usersRef = firestore.collection('users');
  
    var userDocRef = usersRef.doc( );

    return Scaffold(
        //backgroundColor: Colors.grey.shade200,
        appBar: MainAppBar(
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            false),
        body: Flexible(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  StreamBuilder<DocumentSnapshot>(
                    stream: userDocRef.snapshots(),
                    builder:
                        (BuildContext context, AsyncSnapshot asyncSnapshot) {
                      return Text('${usersRef.id}');
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
/*
FutureBuilder<String>(
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BuildProfileData(
              Colors.white,
              80,
              120,
              Alignment.center,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      3,
                      1,
                      20,
                      1,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: BuildColor(),
                      ),
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    nameSurname,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
            BuildProfileDivider(
              1.0,
              BuildColor(),
            ),
            BuildProfileData(
              Colors.white,
              80,
              50,
              Alignment.centerLeft,
              BuildProfileRow(
                email,
                Icons.mail,
              ),
            ),
            BuildProfileDivider(
              1.0,
              BuildColor(),
            ),
            BuildProfileData(
              Colors.white,
              80,
              50,
              Alignment.centerLeft,
              BuildProfileRow(
                phone,
                Icons.phone,
              ),
            ),
            BuildProfileDivider(
              1.0,
              BuildColor(),
            ),
            BuildProfileData(
              Colors.white,
              80,
              50,
              Alignment.centerLeft,
              BuildProfileRow(
                address,
                Icons.home,
              ),
            ),
            BuildProfileDivider(
              1.0,
              BuildColor(),
            ),
          ],
        );
      }),

*/