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
