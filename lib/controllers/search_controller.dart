import 'package:get/get.dart';

class CusomSearchController extends GetxController {
  final List<String> location = [
    'Global',
    'North america',
    'Europe',
    'Asia',
    'Austrilia',
    'South america',
  ];

  var selectedCategories = <String>[].obs;
  var selectedLocations = <String>[].obs;

  RxInt selectedItems = 0.obs;
  RxInt selectedLocation = 0.obs;
  // void countItem() {
  //   selectedItems.value = selectedCategories.length;
  // }

  int get selectedCount => selectedCategories.length;

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    selectedItems.value = selectedCategories.length;
  }

  void toggleLocation(String category) {
    if (selectedLocations.contains(category)) {
      selectedLocations.remove(category);
    } else {
      selectedLocations.add(category);
    }
    selectedLocation.value = selectedLocations.length;
  }

  var selectedValue = 'Today'.obs; // Default value

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }
}
