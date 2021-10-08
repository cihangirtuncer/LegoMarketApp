import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/authenticate/auth_page/auth_type_selector.dart';
import 'package:lego_market_app/core/components/row/profile_row.dart';
import 'package:lego_market_app/core/widget/color.dart';
import 'package:lego_market_app/core/widget/gradient_container.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

import 'Profile_page/profile_build_data.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _ProfileState extends State<Profile> {
  final _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid.toString())
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: MainAppBar(
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          false),
      body: BuildGradientContainer(
        StreamBuilder<DocumentSnapshot>(
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
                    Colors.transparent,
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
                              color: Colors.transparent,
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
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  BuildProfileData(
                    Colors.transparent,
                    80,
                    50,
                    Alignment.centerLeft,
                    BuildProfileRow(
                      data['email'],
                      Icons.mail,
                    ),
                  ),
                  BuildProfileData(
                    Colors.transparent,
                    80,
                    50,
                    Alignment.centerLeft,
                    BuildProfileRow(
                      data['phone'],
                      Icons.phone,
                    ),
                  ),
                  BuildProfileData(
                    Colors.transparent,
                    80,
                    50,
                    Alignment.centerLeft,
                    BuildProfileRow(
                      data['address'],
                      Icons.home,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.grey.shade200,
                          title: Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AuthTypeSelector(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Log out',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(
                                context,
                                'NO',
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
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: BuildColor(),
                      ),
                      title: Text(
                        "Log out",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]);
          },
        ),
      ),
    );
  }
}
