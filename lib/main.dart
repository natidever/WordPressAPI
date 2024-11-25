import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news_app/bindings/main_binder.dart';
import 'package:news_app/route/app_route.dart';
import 'package:news_app/services/ad_services.dart';

Future<void> main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize MobileAds with proper error handling
  try {
    await MobileAds.instance.initialize().then((InitializationStatus status) {
      debugPrint('AdMob SDK initialized');
      status.adapterStatuses.forEach((key, value) {
        debugPrint('Adapter status for $key: ${value.state}');
      });
    });

    // Initialize AdServices after MobileAds
    final adServices = Get.put(AdServices());
    await adServices.initializeAd();
  } catch (e, stackTrace) {
    debugPrint('Error initializing ads: $e');
    debugPrint('Stack trace: $stackTrace');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinder(),
      title: 'News App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}
