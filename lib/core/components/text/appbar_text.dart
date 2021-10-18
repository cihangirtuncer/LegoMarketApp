import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
BuildAppBarText(String letter, Color colors, double fontsize) {
  return Text(letter,
      style: GoogleFonts.rajdhani(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: colors,
          fontSize: fontsize,
        ),
      ));
}
