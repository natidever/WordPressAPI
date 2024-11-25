import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/models/blog_model.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

Widget TrendingNewsCard(
    {String? category,
    String? imageSource,
    String? heading,
    String? publisher,
    String? publisherLogo,
    String? date}) {
  return Stack(
    children: [
      Container(
        width: 301,
        height: 305,
        decoration: BoxDecoration(
          color: customBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Container(
                  width: 285,
                  height: 161,
                  child: imageSource != null && imageSource.startsWith('http')
                      ? Image.network(
                          imageSource,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Image.asset(
                              'assets/images/place_holder.jpg',
                              fit: BoxFit.cover,
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/place_holder.jpg',
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/images/place_holder.jpg',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 8),
              child: Container(
                  width: 269,
                  height: 72,
                  child: PrimaryText700(fontSize: 18.0, text: heading ?? "")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                              fit: BoxFit.cover,
                              publisherLogo ?? 'pathto/default/publisher'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SubText(text: publisher ?? 'default publihser'),
                      ),
                      Image.asset(
                          width: 13,
                          height: 13,
                          'assets/images/icons/verified.png')
                    ],
                  ),
                  SubText(text: date ?? "Date unavailable"),
                ],
              ),
            ),
            // TextButton(onPressed: () {}, child: Text("Bookmark"))
          ],
        ),
      ),
      Positioned(
          // top: 33,
          top: 15,
          left: 15,
          // bottom: 32,
          child: Container(
            decoration: BoxDecoration(
                // color: Color.fromRGBO(187, 204, 75, 1),
                color: Color.fromRGBO(255, 215, 0, 1.0), // Pure Gold
                borderRadius: BorderRadius.circular(5)),
            // width: 84,
            // height: 27,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(
                category ?? "sss",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )),
    ],
  );
}

Widget PublisherCard({
  double? space,
  required BlogPost post,
  RxBool? isOnPage,
}) {
  // Utility functions
  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
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

  String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays == 0) {
        if (difference.inHours == 0) {
          return '${difference.inMinutes}m ago';
        }
        return '${difference.inHours}h ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}d ago';
      } else {
        return '${date.day} ${_getMonthShort(date.month)}';
      }
    } catch (e) {
      return 'Date unavailable';
    }
  }

  // Get excerpt and limit it to 2 lines
  String getExcerpt() {
    final plainText = removeHtmlTags(post.excerpt.rendered);
    final words = plainText.split(' ');
    return words.take(15).join(' ') + (words.length > 15 ? '...' : '');
  }

  return Container(
    width: 392,
    height: 140, // Reduced height for more compact design
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: customBackgroundColor,
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Featured Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 120,
              height: 120,
              child: post.jetpackFeaturedMediaUrl.isNotEmpty
                  ? Image.network(
                      post.jetpackFeaturedMediaUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Image.asset(
                          'assets/images/place_holder.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/place_holder.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(
                      'assets/images/place_holder.jpg',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(width: 12),
          // Content Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  removeHtmlTags(post.title.rendered),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8),
                // Excerpt
                Text(
                  getExcerpt(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
                Spacer(),
                // Date
                Text(
                  formatDate(post.date),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
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

Widget ListOfPublisher({
  String? publisherName,
  String? logo,
}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 60,
            height: 60,
            child: Image.asset(fit: BoxFit.cover, logo ?? ""),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0, 00, 15),
          child: TertiaryText500(18, publisherName ?? "Unknown"),
        ),
        Container(width: 130, height: 40, child: FollowButton())
      ],
    ),
    height: 167,
    width: 147,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(227, 239, 249, 0.3),

      // color: Color.fromRGBO(249, 252, 254, 1),
    ),
  );
}

// Widget SearchedList(){}
