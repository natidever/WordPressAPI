import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constants.dart';

Widget PrimaryText700({
  required double fontSize,
  required String text,
}) {
  return Text(text,
      // textAlign: TextAlign.start,
      style:
          GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: fontSize));
}

Widget TertiaryText500(double fontSize, String text) {
  return Text(text,
      style:
          GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: fontSize));
}

Widget SecondaryText600({required double fontSize, required String text}) {
  return Text(text,
      style: GoogleFonts.roboto(
          color: customTextColor,
          fontWeight: FontWeight.w600,
          fontSize: fontSize));
}

//changing font size if it is used in heading or not (FONTSIZE:18 AND 16 ARE USED AS SECONDARY SIZE )
Widget SubText({required String text, bool? isheading}) {
  return Text(text,
      style: GoogleFonts.sourceSans3(
          fontSize: isheading == true ? 18 : 16,
          fontWeight: FontWeight.w400,
          color: subTextColor));
}
