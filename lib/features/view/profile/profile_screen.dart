import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/navigator/pop.dart';
import 'package:lego_market_app/core/components/navigator/push.dart';

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
      appBar: mainAppBarExt(),
      body: buildGradientContainer(
        StreamBuilder<DocumentSnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return circularProgressExtMeth();
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
                          accountIconExtMeth(),
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
                    ordersButton(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  "Are you sure you want to log out?"),
                              content: Icon(
                                Icons.warning,
                                size: 40,
                                color: redColor,
                              ),
                              actions: <Widget>[
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
                                  onPressed: () => navigatorPop(context),
                                  child: Text('CANCEL'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.green.shade700,
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

  Padding ordersButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: ElevatedButton(
        onPressed: () {
          navigatorPush(
            context,
            OrdersScreen(),
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
    );
  }

  Padding accountIconExtMeth() {
    return Padding(
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
    );
  }

  Center circularProgressExtMeth() {
    return Center(
      child: CircularProgressIndicator(
        color: redColor,
      ),
    );
  }

  AppBar mainAppBarExt() {
    return mainAppBar(
      Text(
        "Profile",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      false,
    );
  }
}
