// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/discover_controller.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/effects.dart';
import 'package:news_app/widgets/layout_helper.dart';

class Discover extends StatefulWidget {
  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> with TickerProviderStateMixin {
  late TabController tabController;
  RxInt currentIndex = 0.obs;

  final homecontroller = Get.find<HomeController>();

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

  List tabBarList = [
    'All',
    'Recommended',
    'Popular',
    'Most Visited',
    'Trending'
  ];

  final dicoverController = Get.find<DiscoverController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: tabBarList.length,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: white,
          elevation: 0,
          backgroundColor: white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(00),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PrimaryText700(fontSize: 26, text: "Discover"),
                ],
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubText(
                        text:
                            "Uncover a world of captivating stories and stay informed"),
                    VerticalSpace(size.height * 0.03),
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Material(
                        color: Colors
                            .transparent, // Make it transparent if you don't want to change the appearance

                        child: CustomSearchBar(
                            readOnly: true,
                            ontap: () {
                              Get.toNamed('/search');
                            }),
                      ),
                    ),
                    VerticalSpace(size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TertiaryText500(20, "Publisher"),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SubText(text: "See All"),
                        )
                      ],
                    ),
                    Container(
                      height: 200, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.fromLTRB(0.0, 10, 16, 0),
                        itemCount: dicoverController.listOfPublisher.length,
                        itemBuilder: (context, index) {
                          final newsItem =
                              dicoverController.listOfPublisher[index];
                          return GestureDetector(
                            onTap: () {
                              // Get.toNamed('/');
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ListOfPublisher(
                                publisherName: newsItem['publisherName'],
                                logo: newsItem['logo'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 32, 0, 10),
                      child: TertiaryText500(20, "News"),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  onTap: (value) async {
                    currentIndex.value = tabController.index;
                  },
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.blue), // Indicator thickness and color
                    insets: EdgeInsets.symmetric(
                        horizontal:
                            10.0), // Adjust the paddinbottg to decrease width
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: List.generate(
                      tabController.length,
                      (index) =>
                          // print('Current index$currentIndex');
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Text(
                                tabBarList[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: currentIndex.value == index
                                        ? primaryColor
                                        : Color.fromRGBO(130, 130, 130, 1)),
                              ),
                            )),
                          )),
                  indicatorColor: Colors.blue,
                  // labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
            ),
            SliverFillRemaining(
                child: TabBarView(
              children: tabBarList.map((tab) {
                return Center(
                  child: ListView.builder(
                    itemCount: homecontroller.publisherList.length,
                    itemBuilder: (context, index) {
                      // final newsItem = homecontroller.publisherList[index];
                      final newsItem = homecontroller.filteredList[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 20, 16, 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/single_publisher');
                          },
                          child: Obx(() {
                            return PublisherCard(
                              isOnPage: false
                                  .obs, //this let the follow button to showup based on the page user in [or other parameter as needed]
                              category: newsItem['Category'],
                              imageSource: newsItem['imageSource'],
                              heading: newsItem['heading'],
                              publisher: newsItem['publisher'],
                              publisherLogo: newsItem['publisherLogo'],
                              date: newsItem['date'],
                            );
                          }),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ))
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 5),
      child: Container(
        // width: 400,
        // height: 400,
        // color: const Color.fromARGB(0, 90, 74, 74),
        // color: const Color.fromARGB(255, 107, 15, 15),

        child: _tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
