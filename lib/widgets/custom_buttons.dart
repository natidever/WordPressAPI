import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

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

Widget ActionBarButton({IconData? icon, bool? iconFound, String? imageSource}) {
  return Container(
    width: 52,
    height: 52,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Color.fromARGB(255, 187, 187, 187).withOpacity(.1),
          )
        ],
        border: Border.all(color: radiusColor),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: iconFound == false
            ? Image.asset(
                imageSource ?? "",
                width: 2,
                height: 30,
              )
            : Icon(icon)),
    //   size:52
    // border--10
    // iconsize=24
  );
}

Widget FollowButton() {
  return Container(
      width: 91,
      height: 34,
      decoration: BoxDecoration(
        color: Color.fromRGBO(236, 236, 237, 1),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: TertiaryText500(14, "Follow")),
      ));
}
// color-rgba(236, 236, 237, 1)
// 	font[500, 14]
// 	radius=7
// 	padding=9,37,9,37

