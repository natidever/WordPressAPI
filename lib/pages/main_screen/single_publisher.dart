import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

class SinglePublisher extends StatelessWidget {
  const SinglePublisher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: white,
        elevation: 0,
        // backgroundColor: white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionBarButton(iconFound: true, icon: Icons.arrow_back),
                HorizontalSpace(15),
                PrimaryText700(fontSize: 22, text: "Forbes News"),
                HorizontalSpace(140),
                Container(
                  width: 45,
                  height: 45,
                  child: ActionBarButton(
                      iconFound: false,
                      imageSource: 'assets/images/icons/more.png'),
                )
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            sliver: SliverToBoxAdapter(
              child: Container(
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
                                'assets/images/icons/publisher3.png'))),
                    HorizontalSpace(28),
                    Column(
                      children: [
                        //shoinfo in row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                PrimaryText700(fontSize: 20, text: "6.4k"),
                                SubText(text: 'News'),
                                // PrimaryText700(fontSize: 18, text: "News"),
                              ],
                            ),
                            HorizontalSpace(30),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PrimaryText700(fontSize: 20, text: "2.4k"),
                                SubText(text: 'Follower'),
                                // PrimaryText700(fontSize: 18, text: "News"),
                              ],
                            ),
                            HorizontalSpace(30),
                            Column(
                              children: [
                                PrimaryText700(fontSize: 20, text: "100"),
                                SubText(text: 'Following'),
                                // PrimaryText700(fontSize: 18, text: "News"),
                              ],
                            ),
                          ],
                        ),
                        VerticalSpace(15),
                        Container(
                          width: 230,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              "Follow",
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}