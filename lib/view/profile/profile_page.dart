import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/appBar/main_appbar.dart';

class MyAccount extends StatefulWidget {
  MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar("Profile"),
      body: Container(),
    );
  }
}
