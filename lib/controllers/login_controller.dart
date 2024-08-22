import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  RxBool isPasswordVissible = false.obs;

  void TogglePasswordVissiblity() {
    print('toggle called');
    isPasswordVissible.toggle();
    print(isPasswordVissible);
  }
}
