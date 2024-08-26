import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

Widget TrendingNewsCard(
    {String? category,
    String? imageSource,
    String? heading,
    String? publisher,
    String? publisherLogo,
    String? date}) {
  return Stack(
    children: [
      Container(
        width: 301,
        // height: 315,
        height: 305,
        decoration: BoxDecoration(
          // color: Color.fromRGBO(249, 252, 254, 1),
          color: customBackgroundColor,
          // color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          // color: Colors.blacktop
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Container(
                    width: 285,
                    height: 161,
                    // height: 264,
                    child: Image.asset(fit: BoxFit.cover, imageSource ?? "")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 8),
              child: Container(
                  width: 269,
                  height: 72,
                  child: PrimaryText700(fontSize: 18.0, text: heading ?? "")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                              fit: BoxFit.cover,
                              publisherLogo ?? 'pathto/default/publisher'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SubText(text: publisher ?? 'default publihser'),
                      ),
                      Image.asset(
                          width: 13,
                          height: 13,
                          'assets/images/icons/verified.png')
                    ],
                  ),
                  SubText(text: "Jun 9, 2023"),
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(
          // top: 33,
          top: 15,
          left: 15,
          // bottom: 32,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(42, 186, 255, 1),
                borderRadius: BorderRadius.circular(5)),
            // width: 84,
            // height: 27,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(
                category ?? "Environment",
                style: TextStyle(color: white),
              ),
            ),
          )),
    ],
  );
}

Widget PublisherCard(
    {double? space,
    String? category,
    RxBool? isOnPage, // Add t
    String? imageSource,
    String? heading,
    String? publisher,
    String? publisherLogo,
    String? date}) {
  return Container(
    width: 392,
    height: 404,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      // color: Color.fromRGBO(249, 252, 254, 1),
      // color: Color.fromRGBO(227, 239, 249, 1),
      color: customBackgroundColor,
      // color: Colors.red

      // color: Color.fromRGBO(249, 252, 254, 1),

      // color: Colors.black
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  ASSETIMAGE
              Container(
                  child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          width: 36,
                          height: 36,
                          child: Image.asset(
                              fit: BoxFit.cover,
                              publisherLogo ?? 'path/to/default/logo'))),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            SubText(
                                text: publisher ?? 'Uknown publisher',
                                isheading: true),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                  width: 18,
                                  height: 18,
                                  fit: BoxFit.cover,
                                  'assets/images/icons/verified.png'),
                            )
                          ],
                        ),
                        SubText(text: date ?? "now")
                      ],
                    ),
                  )
                ],
              )
                  // asst +col=name data

                  ),

              HorizontalSpace(space ?? 0),

              Expanded(
                child: Container(
                  // width: 8/,
                  // color: Color.fromARGB(255, 255, 68, 68),
                  child: Row(
                    children: [
                      //foolow,

                      isOnPage == false ? FollowButton() : Text(''),
                      HorizontalSpace(5),

                      Padding(
                          padding: const EdgeInsets.only(right: 00.0),
                          child: Image.asset(
                              height: 24,
                              width: 24,
                              'assets/images/icons/more.png'))
                      //4dot
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 23.0),
            child: Container(
                width: 360,
                height: 56,
                child:
                    PrimaryText700(fontSize: 20.0, text: heading ?? "Heading")),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Color.fromRGBO(42, 186, 255, 1),
                    )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                  child: Text(
                    category ?? "All",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(42, 186, 255, 1),
                    ),
                  ),
                ),
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 360,
                height: 197,
                child: Image.asset(
                    fit: BoxFit.cover, imageSource ?? "path/to/default/image/"),
              ))
        ],
      ),
    ),
  );
}

Widget ListOfPublisher({
  String? publisherName,
  String? logo,
}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 60,
            height: 60,
            child: Image.asset(fit: BoxFit.cover, logo ?? ""),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0, 00, 15),
          child: TertiaryText500(18, publisherName ?? "Unknown"),
        ),
        Container(width: 130, height: 40, child: FollowButton())
      ],
    ),
    height: 167,
    width: 147,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(227, 239, 249, 0.3),

      // color: Color.fromRGBO(249, 252, 254, 1),
    ),
  );
}

// Widget SearchedList(){}
