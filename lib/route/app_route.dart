import 'package:get/get.dart';
import 'package:news_app/pages/homepage.dart';
import 'package:news_app/pages/onboarding/onboarding.dart';

class AppRoutes {
  // Define route names
  static const home = '/home';
  static const details = '/details';
  static const onboarding = '/onboarding';
  static const login = '/login';

  // Define the routes map u
  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () => OnBoading()),
    GetPage(name: home, page: () => Homepage()),
    GetPage(name: login, page: () => Homepage()),
  ];
}
