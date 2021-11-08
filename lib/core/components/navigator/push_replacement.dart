import 'package:flutter/material.dart';

pushReplacement(BuildContext context, Widget destination) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => destination));
}
