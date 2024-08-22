import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/onboarding/onboarding_1.dart';
import 'package:news_app/pages/onboarding/onboarding_2.dart';
import 'package:news_app/pages/onboarding/onboarding_3.dart';
import 'package:news_app/widgets/carousel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoading extends StatefulWidget {
  // const OnBoading({super.key});

  @override
  State<OnBoading> createState() => _OnBoadingState();
}

class _OnBoadingState extends State<OnBoading> {
  final _controller = PageController();

  PageController controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // width: size.width * 0.6,
              height: size.height * 0.69,

              child: PageView(
                controller: _controller,
                children: [
                  Onboarding1(),
                  Onboarding1(),
                  Onboarding1(),
                ],
              ),
            ),
            // Container(
            //     width: 300,
            //     height: 400,
            //     child: CarouselCustomWidget(
            //       item: [
            //         'assets/images/boarding/boarding_image1.jpg',
            //         'assets/images/boarding/boarding_image1.jpg',
            //         'assets/images/boarding/boarding_image1.jpg'
            //       ],
            //     ))

            SmoothPageIndicator(controller: _controller, count: 3)
          ],
        ),
      ),
    );
  }
}
