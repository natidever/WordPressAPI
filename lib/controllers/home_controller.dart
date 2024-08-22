import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // This list fakes API RESPONSE DATA FROM OUR BACKEND

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
      "heading": "Kim kardashian start her new brand",
      "publisher": "BBC News",
      "publisherLogo": "assets/images/icons/publisher1.png",
      "date": "jun 9,2024",
    },
    {
      "Category": "sport",
      "imageSource": "assets/images/appcontents/heading1.jpg",
      "heading": "Who do you think the most famous guy in NBA",
      "publisher": "BBC NEWS",
      "publisherLogo": "assets/images/icons/publisher1.png",
      "date": "jun 9,2024",
    },
  ];
}
