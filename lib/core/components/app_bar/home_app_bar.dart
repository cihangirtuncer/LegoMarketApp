import 'package:flutter/material.dart';
import '../../widget/appbar_title/appbar_title.dart';

// ignore: non_constant_identifier_names
AppBar HomeAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xF504094E),
    title: BuildHomeAppBarText(26, 10),
    actions: [],
  );
}
