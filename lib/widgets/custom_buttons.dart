import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/layout.dart';

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
// font-size: 18.26px;
// font-weight: 600;
// line-height: 27.39px;
// text-align: center;

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
    String text, double borderRadius, String imageSource,
    {Color color = primaryColor}) {
  return Container(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 8, 00, 8),
          child: Image.asset(width: 20, height: 20, imageSource),
        ),
        HorizontalSpace(70),
        Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
    height: 55,
    width: 392,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: radiusColor)),
  );
}
