import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/discover_controller.dart';
import 'package:news_app/pages/main_screen/post_detail.dart';
import 'package:news_app/services/ad_services.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/custom_texts.dart';

class Discover extends StatefulWidget {
  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final discoverController = Get.find<DiscoverController>();
  final globalAdServices = Get.find<AdServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          'Bookmarks',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SubText(
              text: 'Your saved articles appear here',
              isheading: true,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (discoverController.bookmarkedPosts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No bookmarks yet',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Start saving your favorite articles',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: discoverController.bookmarkedPosts.length,
                itemBuilder: (context, index) {
                  final post = discoverController.bookmarkedPosts[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: GestureDetector(
                      onTap: () async {
                        // Show interstitial ad before navigation
                        await globalAdServices.showInterstitialAd();
                        Get.to(() => PostDetail(post: post));
                      },
                      child: PublisherCard(
                        post: post,
                        isOnPage: false.obs,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
