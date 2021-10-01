// ignore: unused_import
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/authenticate/login/login_body.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

class SignInPage extends StatefulWidget {
  @override
  SignInPageState createState() => SignInPageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class SignInPageState extends State<SignInPage> {
  Key key1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          Text(
            "Login",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          true),
      backgroundColor: Colors.black,
      body: SignInBody(),
    );
  }
}
