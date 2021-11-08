import 'package:flutter/material.dart';

navigatorPush(
  BuildContext context,
  Widget destination,
) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => destination));
}
