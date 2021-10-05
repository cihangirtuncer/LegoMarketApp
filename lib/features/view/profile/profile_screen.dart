import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/divider/profile_divder.dart';
import 'package:lego_market_app/core/components/row/profile_row.dart';
import 'package:lego_market_app/core/widget/color.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

import 'Profile_page/profile_build_data.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          false),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: BuildColor(),
              ),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
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
                          data['name surname'],
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
                      data['email'],
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
                      data['phone'],
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
                      data['address'],
                      Icons.home,
                    ),
                  ),
                  BuildProfileDivider(
                    1.0,
                    BuildColor(),
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/divider/profile_divder.dart';
import 'package:lego_market_app/core/components/row/profile_row.dart';
import 'package:lego_market_app/core/widget/color.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

import 'Profile_page/profile_build_data.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          false),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: BuildColor(),
              ),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
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
                          data['name surname'],
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
                      data['email'],
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
                      data['phone'],
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
                      data['address'],
                      Icons.home,
                    ),
                  ),
                  BuildProfileDivider(
                    1.0,
                    BuildColor(),
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

////////////////////////////////////////////////////////////////


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          Text(
            "Profile",
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

          return ListView(children: [
            Column(
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
                        data['name surname'],
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
                    data['email'],
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
                    data['phone'],
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
                    data['address'],
                    Icons.home,
                  ),
                ),
                BuildProfileDivider(
                  1.0,
                  BuildColor(),
                ),
              ],
            ),
          ]);
        },
      ),
    );
  }
}


*/