import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget TrendingShimmerEffect() {
  return SizedBox(
    width: 301,
    // height: 315,
    height: 305,
    child: Shimmer.fromColors(
      // baseColor: primaryColor
      // // baseColor: Color.fromARGB(255, 247, 247, 247),
      // highlightColor: Color.fromARGB(255, 237, 237, 237),
      baseColor: Color(0xFFF5F5F5), // Light grey base color
      highlightColor: Color(0xFFFFFFFF),
      child: ListView.builder(
          padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              width: 301,
              // height: 315,
              height: 305,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 234, 234, 234),
              ),
            );
          }),
    ),
  );
}

Widget PublisherShimmerEffect() {
  return Shimmer.fromColors(
    baseColor: Color(0xFFEBEBF4),
    highlightColor: Color(0xFFF4F4F4),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: List.generate(
          6,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image placeholder
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12),
                    // Content placeholders
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: double.infinity * 0.7,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 60,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
