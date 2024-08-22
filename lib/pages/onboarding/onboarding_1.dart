import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 150, 0, 10),
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          // width: 328,
          height: 383,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child:
                  Image.asset('assets/images/boarding/boarding_image1.jpg'))),
    );
  }
}
