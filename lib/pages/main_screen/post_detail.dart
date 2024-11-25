import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/discover_controller.dart';
import 'package:news_app/models/blog_model.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';

class PostDetail extends StatelessWidget {
  final BlogPost post;

  const PostDetail({
    super.key,
    required this.post,
  });

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return "${date.day} ${_getMonthShort(date.month)} ${date.year}";
    } catch (e) {
      return 'Date unavailable';
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          GetBuilder<DiscoverController>(
            builder: (controller) {
              final isBookmarked = controller.isBookmarked(post);
              return IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.black,
                ),
                onPressed: () => controller.toggleBookmark(post),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // TODO: Implement share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Tag
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 215, 0, 1.0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  post.categories.isNotEmpty ? "News" : "General",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PrimaryText700(
                fontSize: 24,
                text: removeHtmlTags(post.title.rendered),
              ),
            ),

            // Date and Author Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('assets/images/icons/publisher3.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BBC News",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        formatDate(post.date),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Featured Image
            if (post.jetpackFeaturedMediaUrl.isNotEmpty)
              Container(
                width: size.width,
                height: 250,
                child: Image.network(
                  post.jetpackFeaturedMediaUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/place_holder.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Excerpt (Summary)
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.grey[100],
                    child: Text(
                      removeHtmlTags(post.excerpt.rendered),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Main Content
                  Text(
                    removeHtmlTags(post.content.rendered),
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
