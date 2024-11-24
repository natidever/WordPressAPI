import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/blog_model.dart';

class HomeController extends GetxController {
  // This list fakes API RESPONSE DATA FROM OUR BACKEND

  @override
  void onInit() {
    super.onInit();
    delay();
    filteredList.value = publisherList;
    // Call fetchData method when controller initializes
    fetchBlogPosts();
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
      "Category": "Open",
      "imageSource": "assets/images/appcontents/heading1.jpg",
      "heading": "Global Summit on Climate Change: Historic Agreement Reached",
      "publisher": "BBC News ",
      "publisherLogo": "assets/images/icons/publisher1.png",
      "date": "jun 9,2024",
    },
    {
      "Category": "Open",
      "imageSource": "assets/images/appcontents/heading1.jpg",
      "heading": "Kim kardashian start her new brand,in Las vegas delihem",
      "publisher": "BBC News",
      "publisherLogo": "assets/images/icons/publisher3.png",
      "date": "jun 9,2024",
    },
    {
      "Category": "Open",
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
}
