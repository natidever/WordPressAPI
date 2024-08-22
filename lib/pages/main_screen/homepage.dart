import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/effects.dart';
import 'package:shimmer/shimmer.dart';

class Homepage extends StatelessWidget {
  // const Homepage({super.key});

  final homecontroller = Get.find<HomeController>();

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
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SecondaryText600(fontSize: 28, text: "Welcomback ,Tyler"),
              SubText(
                  text: 'Discover a world of news that matters to you',
                  isheading: true),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
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
              Obx(() {
                return homecontroller.isLoading.value == false
                    ? Container(
                        height: 305,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homecontroller.trendingNewsData.length,
                            itemBuilder: (context, index) {
                              final newsItem =
                                  homecontroller.trendingNewsData[index];
                              return TrendingNewsCard(
                                category: newsItem['Category'],
                                imageSource: newsItem['imageSource'],
                                heading: newsItem['heading'],
                                publisher: newsItem['publisher'],
                                publisherLogo: newsItem['publisherLogo'],
                                date: newsItem['date'],
                              );
                            }),
                      )
                    : SizedBox(
                        height: 305,
                        width: MediaQuery.of(context).size.width,
                        child: TrendingShimmerEffect());
              }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
                child: SecondaryText600(fontSize: 20, text: "Recommendation"),
              ),
              PublisherCard()
            ],
          ),
        ),
      ),
    );
  }
}
