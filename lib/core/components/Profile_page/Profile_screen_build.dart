import 'package:flutter/material.dart';
import 'package:lego_market_app/core/constant/padding/standart_padding.dart';

// ignore: non_constant_identifier_names
BuildProfile() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      BuildPadding(
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          height: 140,
          child: BuildPadding(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Image.asset("assets/icons/account.jpg"),
                ),
              ],
            ),
          ),
        ),
      ),
      BuildPadding(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red.shade200,
          ),
          alignment: Alignment.center,
          height: 40,
          child: Text(
            "address :Lego 1 site / A blok / no: 46",
            style: TextStyle(fontSize: 20),
          ),
        ),
      )
    ],
  );
}
