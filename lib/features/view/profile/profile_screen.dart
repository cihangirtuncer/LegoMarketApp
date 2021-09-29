import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/divider/profile_divder.dart';
import 'package:lego_market_app/core/components/row/profile_row.dart';
import 'package:lego_market_app/core/widget/color.dart';
import 'package:lego_market_app/core/widget/main_appBar.dart';

import 'Profile_page/profile_build_data.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                  "Cihangir Tuncer",
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
              "Email: cihangir******@gmail.com",
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
              "phone: 0539*******",
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
              "address: Lego 1 site / A blok / no: 49",
              Icons.home,
            ),
          ),
          BuildProfileDivider(
            1.0,
            BuildColor(),
          ),
        ],
      ),
    );
  }
}
