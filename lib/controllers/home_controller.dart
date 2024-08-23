import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends GetxController {
  // This list fakes API RESPONSE DATA FROM OUR BACKEND

  @override
  void onInit() {
    super.onInit();
    delay();
    filteredList.value = publisherList;
    // Call fetchData method when controller initializes
  }

  RxBool isLoading = true.obs;
  RxBool isOnPage = false.obs;

  void delay() {
    Future.delayed(Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  final List<Map<String, dynamic>> trendingNewsData = [
    {
      "Category": "Enviroment",
      "imageSource": "assets/images/appcontents/heading1.jpg",
      "heading": "Global Summit on Climate Change: Historic Agreement Reached",
      "publisher": "BBC News ",
      "publisherLogo": "assets/images/icons/publisher1.png",
      "date": "jun 9,2024",
    },
    {
      "Category": "Fashion",
      "imageSource": "assets/images/appcontents/heading1.jpg",
      "heading": "Kim kardashian start her new brand,in Las vegas delihem",
      "publisher": "BBC News",
      "publisherLogo": "assets/images/icons/publisher3.png",
      "date": "jun 9,2024",
    },
    {
      "Category": "sport",
      "imageSource": "assets/images/appcontents/heading1.jpg",
      "heading": "Who do you think the most famous guy in NBA",
      "publisher": "BBC NEWS",
      "publisherLogo": "assets/images/icons/publisher3.png",
      "date": "jun 9,2024",
    },
  ];

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
}
