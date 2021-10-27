import 'package:flutter/material.dart';
import 'package:get/get.dart';

buildShoppingContainer(
  String productName,
  BuildContext context,
  Widget destination,
  String assetsPath,
) {
  return GestureDetector(
    onTap: () {
      Get.to(() => destination);
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            assetsPath,
          ),
          Text(
            productName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ),
  );
}
