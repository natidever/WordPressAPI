import 'package:get/get.dart';
import 'package:news_app/controllers/discover_controller.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/controllers/login_controller.dart';

class MainBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.lazyPut(() => HomeController());
    Get.put(DiscoverController());
  }
}
