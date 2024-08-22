import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/onboarding/onboarding_1.dart';
import 'package:news_app/pages/onboarding/onboarding_2.dart';
import 'package:news_app/pages/onboarding/onboarding_3.dart';
import 'package:news_app/utils/constants.dart';
// import 'package:news_app/widgets/carousel.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/layout.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

//o

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 86, 0, 10),
              child: Center(
                child: SizedBox(
                  // width: size.width * 0.8,
                  // height: size.height * 0.59,
                  height: 450,
                  child: PageView(
                    controller: _controller,
                    children: [
                      Onboarding1(),
                      Onboarding2(),
                      Onboarding3(),
                    ],
                  ),
                ),
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

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: primaryColor,
                  // strokeWidth: 3,
                  dotColor: Color.fromRGBO(243, 244, 246, 1),
                  dotHeight: 9,
                  dotWidth: 9),
            ),
            VerticalSpace(38),
            Text(
              'First to know',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                // font-family: Inter;

                fontSize: 27.39,
                fontWeight: FontWeight.w600,

// line-height: 36.52px;
              ),
            ),
            // VerticalSpace(size.height * 0.04),
            VerticalSpace(26),
            Container(
              width: 246.53,
              height: 55,
              child: Text(
                'All news in one place, be the first to know lnews',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  // font-family: Inter;
                  color: greyTextColor,
                  fontWeight: FontWeight.w400,

                  fontSize: 18,

                  // line-height: 36.52px;
                ),
              ),
            ),
            // VerticalSpace(size.height * 0.048),
            VerticalSpace(70),
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 21, 40),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: CustomPrimaryButton(
                  "Get Started",
                  382,
                  64,
                  12.4,
                ),
              ),
            ),

//             width: 383.49px;
// height: 63.91px;
// top: 805.78px;
// left: 22.83px;
// gap: 0px;
// border-radius: 13.7px 0px 0px 0px;
// opacity: 0px;
          ],
        ),
      ),
    );
  }
}
