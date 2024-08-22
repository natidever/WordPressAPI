import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 36, 30),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
              child: Image.asset(
                  // width: size.width * 0.8,
                  // height: 7,
                  fit: BoxFit.cover,
                  'assets/images/boarding/onboarding_image3.jpg'))),
    );
  }
}
