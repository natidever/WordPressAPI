import 'package:get/get.dart';
import 'package:news_app/pages/homepage.dart';

class AppRoutes {
  // Define route names
  static const home = '/home';
  static const details = '/details';

  // Define the routes map u
  static List<GetPage> routes = [
    GetPage(name: home, page: () => Homepage()),
  ];
}
