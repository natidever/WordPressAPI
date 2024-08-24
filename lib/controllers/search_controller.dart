import 'package:get/get.dart';

class CusomSearchController extends GetxController {
  var selectedCategories = <String>[].obs;

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  var selectedValue = 'Today'.obs; // Default value

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }
}
