import 'package:flutter/material.dart';

buildPaading(
  double? left,
  double? top,
  double? right,
  double? bottom,
) {
  Padding(padding: EdgeInsets.fromLTRB(left!, top!, right!, bottom!));
}
