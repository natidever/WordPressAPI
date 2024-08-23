import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/effects.dart';
import 'package:news_app/widgets/layout_helper.dart';

class SinglePublisher extends StatefulWidget {
  @override
  State<SinglePublisher> createState() => _SinglePublisherState();
}

class _SinglePublisherState extends State<SinglePublisher> {
  // const SinglePublisher({super.key});
  String? dropdownValue = "Enviroment";
  final homecontroller = Get.find<HomeController>();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
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
                ActionBarButton(iconFound: true, icon: Icons.arrow_back),
                HorizontalSpace(15),
                PrimaryText700(fontSize: 22, text: "Forbes News"),
                HorizontalSpace(140),
                Container(
                  width: 45,
                  height: 45,
                  child: ActionBarButton(
                      iconFound: false,
                      imageSource: 'assets/images/icons/more.png'),
                )
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 108,
                width: 392,
                decoration: BoxDecoration(

                    // color: Colors.amber

                    ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Container(
                            child: Image.asset(
                                fit: BoxFit.cover,
                                width: 108,
                                height: 108,
                                'assets/images/icons/publisher3.png'))),
                    HorizontalSpace(28),
                    Column(
                      children: [
                        //shoinfo in row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                PrimaryText700(fontSize: 20, text: "6.4k"),
                                SubText(text: 'News'),
                                // PrimaryText700(fontSize: 18, text: "News"),
                              ],
                            ),
                            HorizontalSpace(30),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PrimaryText700(fontSize: 20, text: "2.4k"),
                                SubText(text: 'Follower'),
                                // PrimaryText700(fontSize: 18, text: "News"),
                              ],
                            ),
                            HorizontalSpace(30),
                            Column(
                              children: [
                                PrimaryText700(fontSize: 20, text: "100"),
                                SubText(text: 'Following'),
                                // PrimaryText700(fontSize: 18, text: "News"),
                              ],
                            ),
                          ],
                        ),
                        VerticalSpace(15),
                        Container(
                          width: 230,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              "Follow",
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  SecondaryText600(fontSize: 24, text: "Forbes"),
                  HorizontalSpace(8),
                  Image.asset(
                      width: 20, height: 20, 'assets/images/icons/verified.png')
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16),
            sliver: SliverToBoxAdapter(
              child: SubText(
                  isheading: false,
                  text:
                      "Empowering your business journey with expert insights and influential perspectives."),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TertiaryText500(20, "News by forbes"),
                  Row(
                    children: [
                      SubText(text: "Sort by:"),
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
                            items: [
                              'Enviroment',
                              'Technology',
                              'Politics',
                              'Sport'
                            ]
                                .map((value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      HorizontalSpace(size.width * 0.3),
                      Image.asset('assets/images/icons/side1.png'),
                      HorizontalSpace(size.width * 0.03),
                      Image.asset('assets/images/icons/side2.png')
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            sliver: SliverToBoxAdapter(
              child: Container(
                  // width: size.width * 0.5,
                  // height: size.width * 0.5,
                  child: CustomSearchBar(
                      onchanged: (query) =>
                          homecontroller.filterPublisherList(query),
                      textEditingController: searchController)),
            ),
          ),
          Obx(() {
            return homecontroller.isLoading.value == false
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        // final newsItem = homecontroller.publisherList[index];
                        final newsItem = homecontroller.filteredList[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 20),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/single_publisher');
                            },
                            child: Obx(() {
                              return PublisherCard(
                                isOnPage: true
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
                      childCount: homecontroller.filteredList.length,
                    ),
                  )
                : SliverToBoxAdapter(
                    child: SizedBox(
                      height: 605,
                      width: MediaQuery.of(context).size.width,
                      child: PublisherShimmerEffect(),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
