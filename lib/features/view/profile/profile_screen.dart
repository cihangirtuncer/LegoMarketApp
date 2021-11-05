import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/app_bar/bottom_navigation_bar.dart';
import '../../../core/components/row/profile_row.dart';
import '../../../core/widget/color.dart';
import '../../../core/widget/gradient_container.dart';
import '../../../core/widget/main_appBar.dart';
import '../orders/orders_screen.dart';
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
  final Color transparentColor = Colors.transparent;
  final Color white12Color = Colors.white12;
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: mainAppBar(
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          false),
      body: buildGradientContainer(
        StreamBuilder<DocumentSnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: redColor,
                ),
              );
            }
            DocumentSnapshot<Object?> data = snapshot.data!;

            return ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildProfileData(
                      transparentColor,
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
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: transparentColor,
                              ),
                              child: Icon(
                                Icons.account_circle_rounded,
                                size: 110,
                                color: whiteColor,
                              ),
                            ),
                          ),
                          Text(
                            data['name surname'],
                            style: TextStyle(
                              fontSize: 23,
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildProfileData(
                      transparentColor,
                      80,
                      60,
                      Alignment.centerLeft,
                      buildProfileRow(
                        data['email'],
                        Icons.mail,
                      ),
                    ),
                    buildProfileData(
                      transparentColor,
                      80,
                      60,
                      Alignment.centerLeft,
                      buildProfileRow(
                        data['phone'],
                        Icons.phone,
                      ),
                    ),
                    buildProfileData(
                      transparentColor,
                      80,
                      60,
                      Alignment.centerLeft,
                      buildProfileRow(
                        data['address'],
                        Icons.home,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(
                            () => OrdersScreen(),
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_basket,
                            size: 27,
                            color: buildColor(),
                          ),
                          title: Text(
                            "Orders",
                            style: TextStyle(
                              fontSize: 20,
                              color: buildColor(),
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            white12Color,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Are you sure you want to log out?",
                            content: Icon(
                              Icons.warning,
                              size: 40,
                              color: redColor,
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BottomHomePage(),
                                    ),
                                  );
                                },
                                child: Text('LOG OUT'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.red.shade700,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => Get.back(),
                                child: Text('CANCEL'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.green.shade700,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                            size: 27,
                            color: buildColor(),
                          ),
                          title: Text(
                            "Log out",
                            style: TextStyle(
                              fontSize: 20,
                              color: buildColor(),
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            white12Color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
