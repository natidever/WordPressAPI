import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/blog_model.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    delay();
    filteredList.value = publisherList;
    fetchBlogPosts();
    fetchTrendingPosts();
    // _createBannerAd();
  }

  RxBool isLoading = true.obs;
  RxBool isOnPage = false.obs;

  void delay() {
    Future.delayed(Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  final trendingNewsData = <Map<String, dynamic>>[].obs;

  final publisherInfo = {
    "publisher": "Author",
    "publisherLogo": "assets/images/avatar.png",
  };

  Future<void> fetchTrendingPosts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final trendingPosts = jsonData.take(3).map((post) {
          final blogPost = BlogPost.fromJson(post);
          return {
            "blogPost": blogPost,
            "Category": "Open",
            "imageSource": blogPost.jetpackFeaturedMediaUrl,
            "heading": removeHtmlTags(blogPost.title.rendered),
            "publisher": publisherInfo["publisher"],
            "publisherLogo": publisherInfo["publisherLogo"],
            "date": formatDate(blogPost.date),
          };
        }).toList();

        trendingNewsData.value = trendingPosts;
      }
    } catch (e) {
      print('Error fetching trending posts: $e');
    }
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final month = _getMonthShort(date.month);
      return "$month ${date.day}, ${date.year}";
    } catch (e) {
      return "Date unavailable";
    }
  }

  String _getMonthShort(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  final List<Map<String, dynamic>> publisherList = [
    {
      "Category": "Enviroment",
      "imageSource": "assets/images/appcontents/heading1.jpg",
      "heading": "Global Summit on Climate Change: Historic Agreement Reached",
      "publisher": "BBC News ",
      "publisherLogo": "assets/images/icons/publisher3.png",
      "date": "Jun 9,2024",
    },
    {
      "Category": "Fashion",
      "imageSource": "assets/images/appcontents/heading1.jpg",
      "heading": "Kim kardashian start her new brand,in Las vegas delihem",
      "publisher": "BBC News",
      "publisherLogo": "assets/images/icons/publisher3.png",
      "date": "Jun 10,2024",
    },
    {
      "Category": "sport",
      "imageSource": "assets/images/appcontents/heading1.jpg",
      "heading": "Who do you think the most famous guy in NBA,Says the GOAT",
      "publisher": "BBC NEWS",
      "publisherLogo": "assets/images/icons/publisher1.png",
      "date": "Jun 9,2024",
    },
  ];

  final filteredList = <Map<String, dynamic>>[].obs;

  void filterPublisherList(String query) {
    if (query.isEmpty) {
      filteredList.value = publisherList;
    } else {
      filteredList.value = publisherList.where((newsItem) {
        final lowerQuery = query.toLowerCase();
        return newsItem['Category'].toLowerCase().contains(lowerQuery) ||
            newsItem['heading'].toLowerCase().contains(lowerQuery) ||
            newsItem['publisher'].toLowerCase().contains(lowerQuery);
      }).toList();
    }
  }

  // Observable variables
  var blogPosts = <BlogPost>[].obs;
  var error = ''.obs;

  // API endpoint
  final String apiUrl = 'https://blog.bolenav.com/wp-json/wp/v2/posts';

  Future<void> fetchBlogPosts() async {
    try {
      isLoading(true);
      error(''); // Reset error message

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        blogPosts.value = BlogPost.fromJsonList(jsonData);
      } else {
        error('Failed to load blog posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      error('Error fetching blog posts: $e');
    } finally {
      isLoading(false);
    }
  }

  // Method to refresh blog posts
  Future<void> refreshBlogPosts() async {
    await fetchBlogPosts();
  }

  // Method to get a single blog post by ID
  BlogPost? getBlogPostById(int id) {
    try {
      return blogPosts.firstWhere((post) => post.id == id);
    } catch (e) {
      return null;
    }
  }

  // BannerAd? bannerAd;
  final isAdLoaded = false.obs;

  // Test ad unit ID
  final String testBannerUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111' // Android test ID
      : 'ca-app-pub-3940256099942544/2934735716'; // iOS test ID

  // void _createBannerAd() {
  //   bannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: testBannerUnitId,
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         isAdLoaded.value = true;
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         print('Ad failed to load: $error');
  //         ad.dispose();
  //       },
  //     ),
  //     request: AdRequest(),
  //   );

  //   bannerAd?.load();
  // }

  @override
  void onClose() {
    // bannerAd?.dispose();
    super.onClose();
  }
}
