import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/bindings/main_binder.dart';
import 'package:news_app/pages/global_error_screen.dart';
import 'package:news_app/route/app_route.dart';

void main() {
  /// handling async errors
  runZonedGuarded(() {
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    // This help use to handle asynchronous error globally
    print('Asynchronous Error: $error');
    //  we can report error to an external service like Sentry
  });

  /// Here ,i used  custom page to handle global errors
  /// Based on which type of error has occured in the application
  /// if the app encounter non-flutter error custom page is used
  /// to handel the error gracefully

  FlutterError.onError = (FlutterErrorDetails details) {
    // Handle synchronous errors globally
    print('Flutter Error: ${details.exceptionAsString()}');

    // Redirect to custom error page using GetX
    if (details.exception is! FlutterError) {
      // Use GetX to navigate to the error page
      print('${details.exceptionAsString()}');
      Get.to(() => GlobalErrorScreen(
            errorMessage: details.exceptionAsString(),
          ));
    }
  };
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: MainBinder(),
        title: 'News App',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: AppRoutes.onboarding,
        getPages: AppRoutes.routes);
  }
}
