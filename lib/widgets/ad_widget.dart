import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news_app/services/ad_services.dart';

class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adServices = Get.find<AdServices>();

    return Obx(() {
      if (!adServices.isAdAvailable.value || adServices.bannerAd == null) {
        return const SizedBox.shrink(); // Hide if no ad is available
      }

      return Container(
        width: double.infinity,
        height: 60, // Standard banner height
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AdWidget(ad: adServices.bannerAd!),
        ),
      );
    });
  }
}
