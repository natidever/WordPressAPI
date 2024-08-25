import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: white,
        elevation: 0,
        backgroundColor: white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryText700(fontSize: 26, text: "Bookmarks"),
                  Container(
                    width: 42,
                    height: 42,
                    child: ActionBarButton(
                        iconFound: false,
                        imageSource: 'assets/images/icons/more.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubText(
                  isheading: true,
                  text: "Personal collection of noteworthy reads"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: CustomSearchBar(hintText: "Search \"Collection\" "),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 210,
                      height: 257,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Container(
                              width: 190,
                              //  width: 95,
                              //   height: 79,
                              height: 109,
                              child: Image.asset(
                                  fit: BoxFit.cover,
                                  "assets/images/appcontents/heading1.jpg"),
                            ),
                          ),
                          VerticalSpace(1),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    child: Container(
                                      width: 95,
                                      height: 79,
                                      child: Image.asset(
                                          fit: BoxFit.cover,
                                          "assets/images/appcontents/heading1.jpg"),
                                    ),
                                  ),
                                ),
                                HorizontalSpace(2),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10)),
                                    child: Container(
                                      width: 95,
                                      height: 79,
                                      child: Image.asset(
                                          fit: BoxFit.cover,
                                          "assets/images/appcontents/heading1.jpg"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          VerticalSpace(5),
                          SecondaryText600(fontSize: 22, text: "Sports"),
                          SubText(text: "5 Business")
                        ],
                      ),
                    ),
                    HorizontalSpace(2),
                    Container(
                      width: 210,
                      height: 257,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Container(
                              width: 190,
                              //  width: 95,
                              //   height: 79,
                              height: 109,
                              child: Image.asset(
                                  fit: BoxFit.cover,
                                  "assets/images/appcontents/heading1.jpg"),
                            ),
                          ),
                          VerticalSpace(1),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    child: Container(
                                      width: 95,
                                      height: 79,
                                      child: Image.asset(
                                          fit: BoxFit.cover,
                                          "assets/images/appcontents/heading1.jpg"),
                                    ),
                                  ),
                                ),
                                HorizontalSpace(2),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10)),
                                    child: Container(
                                      width: 95,
                                      height: 79,
                                      child: Image.asset(
                                          fit: BoxFit.cover,
                                          "assets/images/appcontents/heading1.jpg"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          VerticalSpace(5),
                          SecondaryText600(fontSize: 22, text: "Sports"),
                          SubText(text: "3 News")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
