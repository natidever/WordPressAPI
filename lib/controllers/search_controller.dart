import 'package:get/get.dart';

class CusomSearchController extends GetxController {
  var selectedCategory = ''.obs;

//this function used to ta
  void toggleCategory(String category) {
    if (selectedCategory.value == category) {
      selectedCategory.value = ''; // Deselect if already selectedP
    } else {
      selectedCategory.value = category; // Select the new category
    }
  }

  var selectedValue = 'Today'.obs; // Default value

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }
}
