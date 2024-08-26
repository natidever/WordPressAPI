import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

import '../../widgets/custom_buttons.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    child:
                        ActionBarButton(iconFound: true, icon: Icons.settings),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SubText(isheading: true, text: "thetylerm_news"),
              ),
              Container(
                height: 108,
                width: 392,
                decoration: BoxDecoration(

                    // color: Colors.amber

                    ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Container(
                            child: Image.asset(
                                fit: BoxFit.cover,
                                width: 108,
                                height: 108,
                                'assets/images/appcontents/profile.png'))),
                    HorizontalSpace(size.width * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //shoinfo in row
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  PrimaryText700(fontSize: 20, text: "0"),
                                  SubText(text: 'News'),
                                  // PrimaryText700(fontSize: 18, text: "News"),
                                ],
                              ),
                              HorizontalSpace(30),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  PrimaryText700(fontSize: 20, text: "5"),
                                  SubText(text: 'Follower'),
                                  // PrimaryText700(fontSize: 18, text: "News"),
                                ],
                              ),
                              HorizontalSpace(30),
                              Column(
                                children: [
                                  PrimaryText700(fontSize: 20, text: "10"),
                                  SubText(text: 'Following'),
                                  // PrimaryText700(fontSize: 18, text: "News"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        VerticalSpace(
                            MediaQuery.of(context).size.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: Container(
                            width: 230,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(225, 224, 224, 1),
                            ),
                            child: Center(
                              child: Text(
                                "Create News",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 9),
                child: PrimaryText700(fontSize: 24, text: "Tayler Mason News"),
              ),
              SubText(
                  text: "This is Tayler Mason News,Enjoy ", isheading: true),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 10),
                child: TertiaryText500(20, "Yours News"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
