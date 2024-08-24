import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/search_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // const Search({super.key});
  final controller = Get.find<CusomSearchController>();

  String? selectedValue;

  final List<String> categories = [
    'This Week',
    'Politics',
    'Health',
    'World',
    'Asia',
    'South america',
    "Add Filter"
  ];

  final List<String> categories2 = [
    'Business',
    'Politics',
    'Lifestyle',
    'Art',
    'healt',
    'Tech',
    "Travel",
    "Fashion",
    "Sport",
    "Food",
    "World",
    "Science",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0,
        // backgroundColor: white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: ActionBarButton(
                        iconFound: true, icon: Icons.arrow_back)),
                HorizontalSpace(15),
                SizedBox(width: 328, child: CustomSearchBar())
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories.asMap().entries.map((entry) {
                  int index = entry.key;
                  String category = entry.value;
                  bool isLastElement = index == categories.length - 1;

                  return Obx(() => GestureDetector(
                        onTap: () {
                          if (isLastElement) {
                            // Open Bottom Sheet for the last item (Assumeing our last item ins add filter)
                            showModalBottomSheet(
                              showDragHandle: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: size.width,
                                  height: size.height * 0.8,
                                  padding: EdgeInsets.only(left: 16),
                                  child: Obx(() {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SecondaryText600(
                                            fontSize: 22, text: 'Filters'),
                                        SubText(
                                            isheading: true,
                                            text: "Works only for news"),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 24.0),
                                          child: SecondaryText600(
                                              fontSize: 22, text: 'Date Range'),
                                        ),
                                        // Radio buttons start here

                                        Theme(
                                          data: Theme.of(context).copyWith(
                                            unselectedWidgetColor: Colors
                                                .red, // Change this to your desired color
                                          ),
                                          child: RadioListTile<String>(
                                            toggleable: true,
                                            title: Text(
                                              'Today',
                                              style: TextStyle(
                                                color: controller.selectedValue
                                                            .value ==
                                                        'Today'
                                                    ? Colors.black
                                                    : Colors.grey,
                                              ),
                                            ),
                                            value: 'Today',
                                            contentPadding: EdgeInsets.all(0),

                                            groupValue:
                                                controller.selectedValue.value,

                                            activeColor:
                                                customBlue, // Selected color
                                            onChanged: (value) {
                                              setState(() {
                                                controller.selectedValue.value =
                                                    value!;

                                                controller
                                                    .updateSelectedValue(value);
                                              });
                                            },
                                          ),
                                        ),
                                        RadioListTile<String>(
                                          title: Text(
                                            'This Week',
                                            style: TextStyle(
                                              color: controller.selectedValue
                                                          .value ==
                                                      'This Month'
                                                  ? Colors.black
                                                  : Colors.grey,
                                            ),
                                          ),
                                          value: 'This Week',
                                          toggleable: true,
                                          contentPadding: EdgeInsets.all(0),
                                          groupValue:
                                              controller.selectedValue.value,
                                          activeColor: Colors.blue,
                                          onChanged: (value) {
                                            setState(() {
                                              controller.selectedValue.value =
                                                  value!;

                                              controller
                                                  .updateSelectedValue(value);
                                            });
                                          },
                                        ),
                                        RadioListTile<String>(
                                          title: Text(
                                            'This Month',
                                            style: TextStyle(
                                              color: controller.selectedValue
                                                          .value ==
                                                      'This Month'
                                                  ? Colors.black
                                                  : Colors.grey,
                                            ),
                                          ),
                                          value: 'This Month',
                                          contentPadding: EdgeInsets.all(0),
                                          groupValue:
                                              controller.selectedValue.value,
                                          activeColor: Colors.blue,
                                          toggleable: true,
                                          onChanged: (value) {
                                            setState(() {
                                              controller.selectedValue.value =
                                                  value!;

                                              controller
                                                  .updateSelectedValue(value);
                                            });
                                          },
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: SecondaryText600(
                                              fontSize: 20,
                                              text: 'Category(3)'),
                                        ),

                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18.0),
                                            child: Wrap(
                                              spacing: 7,
                                              runSpacing: 10,
                                              children: categories2
                                                  .map((
                                                    category,
                                                  ) =>
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .toggleCategory(
                                                                  category);
                                                        },
                                                        child:
                                                            Obx(() => Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: controller
                                                                              .selectedCategories
                                                                              .contains(category)
                                                                          ? customBlue
                                                                          : radiusColor,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            10),
                                                                    child: Text(
                                                                      category,
                                                                      style:
                                                                          TextStyle(
                                                                        color: const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            121,
                                                                            121,
                                                                            121),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )),
                                                      ))
                                                  .toList(),
                                            ))
                                      ],
                                    );
                                  }),
                                );
                              },
                            );
                          } else {
                            // Toggle category for other items
                            controller.toggleCategory(category);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                controller.selectedCategories.contains(category)
                                    ? overlayBackground
                                    : null,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                                  radiusColor, // Change border color for last element
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isLastElement
                                    ? Colors.blue
                                    : Color.fromARGB(255, 121, 121, 121),
                              ),
                            ),
                          ),
                        ),
                      ));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
