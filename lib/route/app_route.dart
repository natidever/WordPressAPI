import 'package:get/get.dart';
import 'package:news_app/pages/main_screen/base_screen.dart';
import 'package:news_app/pages/main_screen/bookmark.dart';
import 'package:news_app/pages/main_screen/discover.dart';
import 'package:news_app/pages/main_screen/homepage.dart';
import 'package:news_app/pages/login.dart';
import 'package:news_app/pages/main_screen/profile.dart';
import 'package:news_app/pages/main_screen/search.dart';
import 'package:news_app/pages/main_screen/single_publisher.dart';
import 'package:news_app/pages/onboarding/onboarding.dart';

class AppRoutes {
  // Define route names
  static const home = '/home';
  static const details = '/details';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const base_screen = '/base_screen';
  static const bookmark = '/bookmark';
  static const discover = '/discover';
  static const profile = '/profile';
  static const single_publisher = '/single_publisher';
  static const search = '/search';

  // Define the routes map u
  static List<GetPage> routes = [
    GetPage(name: onboarding, page: () => OnBoading()),
    GetPage(name: home, page: () => Homepage()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: base_screen, page: () => BaseScreen()),
    GetPage(name: bookmark, page: () => Bookmark()),
    GetPage(name: discover, page: () => Discover()),
    GetPage(name: profile, page: () => Profile()),
    GetPage(name: single_publisher, page: () => SinglePublisher()),
    GetPage(name: search, page: () => Search()),
  ];
}
