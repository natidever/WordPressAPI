import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_texts.dart';

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
          color: Color.fromRGBO(249, 252, 254, 1),
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
                  child: PrimaryText700(
                      fontSize: 18.0,
                      text:
                          'Global Summit on Climate Change: Historic Agreement Reached')),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: Image.asset(
                            width: 24,
                            height: 24,
                            'assets/images/icons/publisher1.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SubText(text: "BBC News"),
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
