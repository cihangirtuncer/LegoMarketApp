import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/Profile_page/Profile_screen_build.dart';
import 'package:lego_market_app/core/constant/app_bar/main_appbar.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade200,
      appBar: BuildAppBar("Profile"),
      body: BuildProfile(),
    );
  }
}
