import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';

Widget CustomPrimaryButton(
    String text, double width, double height, BorderRadius borderRadius,
    {Color color = primaryColor}) {
  return Container(
    child: Center(
      child: Text(text),
    ),
    height: height,
    width: width,
    decoration: BoxDecoration(borderRadius: borderRadius),
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
