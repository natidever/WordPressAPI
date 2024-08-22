import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        SizedBox(
            // height: 420, child: Image.asset('/assets/images/splash/logo.png')

            ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'finaly',
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'page3description',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        GestureDetector(
            onTap: () => Get.offAllNamed('/home'), child: Text("skip"))
      ],
    ));
  }
}
