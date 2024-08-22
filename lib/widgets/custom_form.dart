import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constants.dart';

class CustomForm extends StatelessWidget {
  String? hintText;
  Image? trailingIcon;
  Image? prefixIcon;
  bool? isPassword;

  CustomForm({
    required bool isPassword,
    prefixIcon,
    trailingIcon,
    required hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 392*64
      width: 392,
      height: 64,
      decoration: BoxDecoration(
          color: Color.fromRGBO(249, 252, 254, 1),
          borderRadius: BorderRadius.circular(10)),

      child: TextFormField(
        obscureText: isPassword == true ? true : false,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            prefixIconColor: subTextColor,
            hintStyle: GoogleFonts.sourceSans3(
                fontSize: 18, fontWeight: FontWeight.w400, color: subTextColor),
            hintText: hintText),
      ),
    );
  }
}
