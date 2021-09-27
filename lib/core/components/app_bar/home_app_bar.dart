import 'package:flutter/material.dart';
import '../../widget/appbar_title/appbar_title.dart';

// ignore: non_constant_identifier_names
AppBar HomeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.indigo.shade900,
    title: BuildHomeAppBarText(26, 10),
    actions: [],
  );
}
