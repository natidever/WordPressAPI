import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionBarButton(iconFound: true, icon: Icons.menu),
                    ActionBarButton(
                        iconFound: false,
                        imageSource: 'assets/images/icons/notification.png')
                  ],
                ),
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SecondaryText600(fontSize: 28, text: "Welcomback ,Tyler"),
              SubText(
                  text: 'Discover a world of news that matters to you',
                  isheading: true),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SecondaryText600(fontSize: 20, text: "Trending News"),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SubText(text: 'See All', isheading: true),
                    ),
                    //                   seeall
                    //                   //styleName: Text/Small Text-regular;
                    // font-family: Source Sans Pro;
                    // font-size: 16px;
                    // font-weight: 400;
                    // line-height: 20.11px;
                    // text-align: left;
                  ],
                ),
              ),
              TrendingNewsCard(
                  imageSource: "assets/images/appcontents/heading1.jpg")
            ],
          ),
        ),
      ),
    );
  }
}
