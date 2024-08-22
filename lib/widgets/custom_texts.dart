import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constants.dart';

Widget PrimaryText700({required double fontSize, required String text}) {
  return Text(text, style: GoogleFonts.roboto(fontWeight: FontWeight.w700));
}

Widget TertiaryText500(double fontSize, String text) {
  return Text(text, style: GoogleFonts.roboto(fontWeight: FontWeight.w500));
}

Widget SecondaryText600({required double fontSize, required String text}) {
  return Text(text,
      style: GoogleFonts.roboto(
          color: customTextColor,
          fontWeight: FontWeight.w600,
          fontSize: fontSize));
}

Widget SubText({required String text}) {
  return Text(text,
      style: GoogleFonts.sourceSans3(
          fontSize: 16, fontWeight: FontWeight.w400, color: subTextColor));
}
