import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/ad_widget.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/effects.dart';
import 'package:shimmer/shimmer.dart';
import 'package:news_app/services/ad_services.dart';
// import 'package:appodeal/appodeal.dart';
// import 'package:news_app/widgets/ad_widget.dart';

class Homepage extends StatelessWidget {
  final homecontroller = Get.find<HomeController>();
  final globalAdServices = Get.find<AdServices>();

  Widget _buildBannerAdWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const AdBannerWidget(),
    );
  }

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
                SecondaryText600(fontSize: 28, text: "Welcomeback, Mosam"),
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
                        // Show ad after every 3 items
                        if (index > 0 && index % 4 == 3) {
                          return _buildBannerAdWidget();
                        }

                        // Calculate actual post index (accounting for ad slots)
                        final postIndex = index - (index ~/ 4);
                        if (postIndex >= homecontroller.blogPosts.length) {
                          return null;
                        }

                        final post = homecontroller.blogPosts[postIndex];
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
                      // Adjust child count to account for ads
                      childCount: homecontroller.blogPosts.length +
                          (homecontroller.blogPosts.length ~/ 3),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
