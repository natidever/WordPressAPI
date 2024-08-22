import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constants.dart';

Widget CustomPrimaryButton(
  String text,
  double width,
  double height,
  double borderRadius, {
  Color color = primaryColor,
}) {
  return Container(
    child: Center(
      child: Text(text,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: white,
          )),
    ),
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(borderRadius)),
  );
}

Widget CustomSecondaryButton(
    String text, BorderRadius borderRadius, String imageSource,
    {Color color = primaryColor}) {
  return Container(
    child: Row(
      children: [
        Image.asset('{$imageSource}'),
        Center(
          child: Text(text),
        ),
      ],
    ),
    height: 70,
    width: 150,
    decoration: BoxDecoration(borderRadius: borderRadius),
  );
}
