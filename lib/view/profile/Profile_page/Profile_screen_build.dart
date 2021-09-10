import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/divider/profile_divder.dart';
import 'package:lego_market_app/core/components/row/profile_row.dart';
import 'profile_build_data.dart';

// ignore: non_constant_identifier_names
BuildProfile() {
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
              padding: const EdgeInsets.fromLTRB(3, 1, 20, 1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.shade900,
                ),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 110,
                  color: Colors.white,
                ),
              ),
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
        80,
        50,
        Alignment.centerLeft,
        BuildProfileRow(
          "Email: cihangir******@gmail.com",
          Icons.mail,
        ),
      ),
      BuildProfileDivider(1.0),
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
      BuildProfileDivider(1.0),
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
      BuildProfileDivider(1.0),
    ],
  );
}
