import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/effects.dart';
import 'package:shimmer/shimmer.dart';

class Homepage extends StatelessWidget {
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: white,
        elevation: 0,
        backgroundColor: white,
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
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(18.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SecondaryText600(fontSize: 28, text: "Welcomeback, Tyler"),
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
                    ],
                  ),
                ),
                Obx(() {
                  return homecontroller.isLoading.value == false
                      ? SizedBox(
                          height: 305,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homecontroller.trendingNewsData.length,
                            itemBuilder: (context, index) {
                              final newsItem =
                                  homecontroller.trendingNewsData[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: TrendingNewsCard(
                                  category: newsItem['Category'],
                                  imageSource: newsItem['imageSource'],
                                  heading: newsItem['heading'],
                                  publisher: newsItem['publisher'],
                                  publisherLogo: newsItem['publisherLogo'],
                                  date: newsItem['date'],
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          height: 305,
                          width: MediaQuery.of(context).size.width,
                          child: TrendingShimmerEffect(),
                        );
                }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
                  child: SecondaryText600(fontSize: 20, text: "Recommendation"),
                ),
              ]),
            ),
          ),
          Obx(() {
            return homecontroller.isLoading.value
                ? SliverToBoxAdapter(
                    child: PublisherShimmerEffect(),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final post = homecontroller.blogPosts[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 20),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/single_publisher');
                            },
                            child: PublisherCard(
                              space: size.width * 0.1,
                              isOnPage: false.obs,
                              post: post,
                            ),
                          ),
                        );
                      },
                      childCount: homecontroller.blogPosts.length,
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
