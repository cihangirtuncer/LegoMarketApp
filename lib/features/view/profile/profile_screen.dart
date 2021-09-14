import 'package:flutter/material.dart';
import '../../../core/components/app_bar/main_app_bar.dart';
import 'Profile_page/Profile_screen_build.dart';

class Profile extends StatefulWidget {
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
