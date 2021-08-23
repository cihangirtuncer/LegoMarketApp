import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/Profile_page/profile_build_data.dart';
import 'package:lego_market_app/core/constant/divider/profile_divder.dart';

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
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      BuildProfileDvider(1.0),
      BuildProfileData(
        Colors.white,
        7.0,
        80,
        50,
        Alignment.centerLeft,
        Text(
          "phone: 0539*******",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      BuildProfileDvider(1.0),
      BuildProfileData(
        Colors.white,
        7.0,
        80,
        50,
        Alignment.centerLeft,
        Text(
          "Email: cihangir******@gmail.com",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      BuildProfileDvider(1.0),
      BuildProfileData(
        Colors.white,
        7.0,
        80,
        50,
        Alignment.centerLeft,
        Text(
          "address: Lego 1 site / A blok / no: 46",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      BuildProfileDvider(1.0),

      /*
      BuildPadding(
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 120,
              height: 100,
              child: BuildPadding(Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.blue.shade800,
              )),
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 100,
              child: BuildPadding(Text(
                "Cihangir Tuncer",
                style: TextStyle(fontSize: 20),
              )),
            ),
          ],
        ),
      ),
      BuildPadding(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          height: 40,
          child: Text(
            "address :Lego 1 site / A blok / no: 46",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ), */
    ],
  );
}
