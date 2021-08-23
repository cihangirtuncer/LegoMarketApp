import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/Profile_page/profile_build_data.dart';
import 'package:lego_market_app/core/constant/divider/profile_divder.dart';
import 'package:lego_market_app/core/constant/row/profile_row.dart';

// ignore: non_constant_identifier_names
BuildProfile() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      BuildProfileData(
        Colors.white,
        7.0,
        80,
        120,
        Alignment.center,
        Row(
          children: [
            Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.blue.shade800,
            ),
            Text(
              "Cihangir Tuncer",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      BuildProfileDivider(1.0),
      BuildProfileData(
        Colors.white,
        7.0,
        80,
        50,
        Alignment.centerLeft,
        BuildProfileRow("phone: 0539*******", Icons.phone),
      ),
      BuildProfileDivider(1.0),
      BuildProfileData(
        Colors.white,
        7.0,
        80,
        50,
        Alignment.centerLeft,
        BuildProfileRow("Email: cihangir******@gmail.com", Icons.mail),
      ),
      BuildProfileDivider(1.0),
      BuildProfileData(
        Colors.white,
        7.0,
        80,
        50,
        Alignment.centerLeft,
        BuildProfileRow("address: Lego 1 site / A blok / no: 49", Icons.home),
      ),
      BuildProfileDivider(1.0),
    ],
  );
}
