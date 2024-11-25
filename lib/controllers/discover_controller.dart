import 'package:get/get.dart';
import 'package:news_app/models/blog_model.dart';
// import 'package:shared_preferences.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DiscoverController extends GetxController {
  final listOfPublisher = [
    {
      "publisherName": "BBC News",
      "logo": "assets/images/icons/publisher1.png",
    },
    {
      "publisherName": "ABC News",
      "logo": "assets/images/icons/publisher5.png",
    },
    {
      "publisherName": "Fox News",
      "logo": "assets/images/icons/publisher4.png",
    },
  ];

  // Observable list of bookmarked posts
  final RxList<BlogPost> bookmarkedPosts = <BlogPost>[].obs;

  // Key for SharedPreferences
  static const String bookmarksKey = 'bookmarked_posts';

  @override
  void onInit() {
    super.onInit();
    loadBookmarkedPosts();
  }

  // Load bookmarked posts from local storage
  Future<void> loadBookmarkedPosts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? bookmarksJson = prefs.getString(bookmarksKey);

      if (bookmarksJson != null) {
        final List<dynamic> decoded = json.decode(bookmarksJson);
        bookmarkedPosts.value =
            decoded.map((item) => BlogPost.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error loading bookmarks: $e');
    }
  }

  // Save bookmarks to local storage
  Future<void> saveBookmarks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encodedData = json.encode(
        bookmarkedPosts.map((post) => post.toJson()).toList(),
      );
      await prefs.setString(bookmarksKey, encodedData);
    } catch (e) {
      print('Error saving bookmarks: $e');
    }
  }

  // Add a post to bookmarks
  Future<void> addToBookmarks(BlogPost post) async {
    if (!isBookmarked(post)) {
      bookmarkedPosts.add(post);
      await saveBookmarks();
      Get.snackbar(
        'Bookmark Added',
        'Article has been bookmarked successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Remove a post from bookmarks
  Future<void> removeFromBookmarks(BlogPost post) async {
    bookmarkedPosts.removeWhere((p) => p.id == post.id);
    await saveBookmarks();
    Get.snackbar(
      'Bookmark Removed',
      'Article has been removed from bookmarks',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Check if a post is bookmarked
  bool isBookmarked(BlogPost post) {
    return bookmarkedPosts.any((p) => p.id == post.id);
  }

  // Toggle bookmark status
  Future<void> toggleBookmark(BlogPost post) async {
    if (isBookmarked(post)) {
      await removeFromBookmarks(post);
    } else {
      await addToBookmarks(post);
    }
  }
}
