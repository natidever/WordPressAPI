import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controllers/search_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

late TabController tabController;

class _SearchState extends State<Search> with TickerProviderStateMixin {
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

  // const Search({super.key});
  final controller = Get.find<CusomSearchController>();

  RxInt currentIndex = 0.obs;
  String? dropdownValue = "Enviroment";
  String? selectedValue;
  List tabBarList = ['News', "Publisher"];

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: tabBarList.length, vsync: this);

    currentIndex.listen((newindex) {
      print('newindex$newindex');
    });
    tabController.addListener(handelevent);
    super.initState();
  }

  void handelevent() {
    currentIndex.value = tabController.index;
    print('currentIndexxx$currentIndex');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
                HorizontalSpace(5),
                SizedBox(width: size.width * 0.8, child: CustomSearchBar())
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
                                return SingleChildScrollView(
                                  child: Container(
                                    width: size.width,
                                    height: size.height * 0.93,
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
                                            padding: const EdgeInsets.only(
                                                top: 24.0),
                                            child: SecondaryText600(
                                                fontSize: 22,
                                                text: 'Date Range'),
                                          ),
                                          // Radio buttons start here

                                          RadioListTile<String>(
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

                                          RadioListTile<String>(
                                            toggleable: true,
                                            title: Text(
                                              'This Week',
                                              style: TextStyle(
                                                color: controller.selectedValue
                                                            .value ==
                                                        'This Week'
                                                    ? Colors.black
                                                    : Colors.grey,
                                              ),
                                            ),
                                            value: 'This Week',
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

                                          RadioListTile<String>(
                                            toggleable: true,
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

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Obx(() {
                                              return SecondaryText600(
                                                  fontSize: 20,
                                                  text:
                                                      'Category(${controller.selectedItems.value})');
                                            }),
                                          ),

                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Wrap(
                                                spacing: 7,
                                                runSpacing: 10,
                                                children: categories2
                                                    .map((
                                                      category,
                                                    ) =>
                                                        GestureDetector(
                                                          onTap: () {
                                                            // controller
                                                            //     .countItem();
                                                            controller
                                                                .toggleCategory(
                                                                    category);
                                                          },
                                                          child:
                                                              Obx(
                                                                  () =>
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          border:
                                                                              Border.all(
                                                                            color: controller.selectedCategories.contains(category)
                                                                                ? customBlue
                                                                                : radiusColor,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 10,
                                                                              vertical: 10),
                                                                          child:
                                                                              Text(
                                                                            category,
                                                                            style:
                                                                                TextStyle(
                                                                              color: controller.selectedCategories.contains(category) ? Colors.black : Color.fromARGB(255, 131, 125, 125),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )),
                                                        ))
                                                    .toList(),
                                              )),

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8.0, 25, 10, 10),
                                            child: Obx(() {
                                              return SecondaryText600(
                                                  fontSize: 20,
                                                  text:
                                                      'Location(${controller.selectedLocation.value})');
                                            }),
                                          ),

                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Wrap(
                                                spacing: 7,
                                                runSpacing: 10,
                                                children: controller.location
                                                    .map((
                                                      category,
                                                    ) =>
                                                        GestureDetector(
                                                          onTap: () {
                                                            // controller
                                                            //     .countItem();
                                                            controller
                                                                .toggleLocation(
                                                                    category);
                                                          },
                                                          child:
                                                              Obx(
                                                                  () =>
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          border:
                                                                              Border.all(
                                                                            color: controller.selectedLocations.contains(category)
                                                                                ? customBlue
                                                                                : radiusColor,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 10,
                                                                              vertical: 10),
                                                                          child:
                                                                              Text(
                                                                            category,
                                                                            style:
                                                                                TextStyle(
                                                                              color: controller.selectedLocations.contains(category) ? Colors.black : const Color.fromARGB(255, 121, 121, 121),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )),
                                                        ))
                                                    .toList(),
                                              )),

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 40, 5, 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // CustomPrimaryButton(
                                                //     textColor: Colors.black,
                                                //     color: Color.fromRGBO(
                                                //         225, 224, 224, 1),
                                                //     "Reset",
                                                //     190,
                                                //     55,
                                                //     10),
                                                CustomPrimaryButton(
                                                    textColor: Colors.black,
                                                    color: Color.fromRGBO(
                                                        225, 224, 224, 1),
                                                    "Reset",
                                                    size.width * 0.45,
                                                    55,
                                                    10),

                                                HorizontalSpace(0),
                                                CustomPrimaryButton(
                                                    textColor: Colors.white,
                                                    color: Colors.black,
                                                    "Done",
                                                    size.width * 0.45,
                                                    55,
                                                    10)
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                  ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
              child: DefaultTabController(
                length: tabBarList.length,
                child: Material(
                  color: Colors.white,
                  borderOnForeground: false,
                  shadowColor: Colors.transparent,
                  elevation: 0.0,
                  child: TabBar(

                      // indicatorColor: Colors.amberAccent,
                      onTap: (value) async {
                        currentIndex.value = tabController.index;
                      },
                      // unselectedLabelStyle: TextStyle(color: Colors.red),
                      // padding: EdgeInsets.only(bottom: 10),
                      labelPadding: EdgeInsets.all(10),
                      //     ? EdgeInsets.fromLTRB(10, 0, 8, 0)
                      //     : EdgeInsets.fromLTRB(0, 10, 10, 20),
                      enableFeedback: false,
                      indicator:
                          UnderlineTabIndicator(borderSide: BorderSide.none),
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      // padding: EdgeInsets.all(23),
                      controller: tabController,
                      splashFactory: NoSplash.splashFactory,
                      tabs: List.generate(
                          tabController.length,
                          (index) => Obx(() {
                                print('Current index$currentIndex');
                                return Container(
                                  decoration: BoxDecoration(
                                      // color: Colors.white
                                      // borderRadius: BorderRadius.circular(5),
                                      ),
                                  child: Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(tabBarList[index],
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                currentIndex.value == index
                                                    ? 24
                                                    : 20,
                                            color: currentIndex.value == index
                                                ? Colors.black
                                                : subTextColor)),
                                  )),
                                );
                              }))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  SubText(text: "600 Results Found"),
                  Container(
                    height: 45,

                    // margin: EdgeInsets.all(20),
                    child: DropdownButtonHideUnderline(
                      child: GFDropdown(
                        // itemHeight: 60,
                        padding: const EdgeInsets.all(10),
                        border: BorderSide.none,
                        dropdownButtonColor: Colors.white,
                        value: dropdownValue,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: ['Open', 'Open', 'Open', 'Open']
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height,
              child: TabBarView(
                controller: tabController,
                children: tabBarList.map((tab) {
                  return Center(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        // final newsItem = homecontroller.publisherList[index];

                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 20, 16, 20),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/single_publisher');
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      width: 128,
                                      height: 114,
                                      child: Image.asset(
                                          fit: BoxFit.cover,
                                          'assets/images/appcontents/heading1.jpg'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              width: 258,
                                              height: 72,
                                              child: Text(
                                                "Global Summit on Climate Change: Historic Agreement Reached",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              )),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        child: Container(
                                                          width: 24,
                                                          height: 24,
                                                          child: Image.asset(
                                                              'assets/images/icons/publisher1.png'),
                                                        ),
                                                      ),
                                                      HorizontalSpace(5),
                                                      SubText(text: "BBC News"),
                                                      HorizontalSpace(5),
                                                      Image.asset(
                                                          width: 16,
                                                          height: 16,
                                                          'assets/images/icons/verified.png')
                                                    ],
                                                  ),
                                                ),
                                                SubText(text: "June 10 ,2024")
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              width: 392,
                              // width: size.width,
                              height: 144,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
