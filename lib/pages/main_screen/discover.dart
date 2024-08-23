import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/cards.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                children: [
                  SubText(
                      text:
                          "Uncover a world of captivating stories and stay informed"),
                  VerticalSpace(size.height * 0.03),
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: CustomSearchBar(),
                  ),
                  VerticalSpace(size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TertiaryText500(20, "Publisher"),
                      SubText(text: "See All")
                    ],
                  ),
                  ListOfPublisher(
                      logo: "assets/images/icons/publisher1.png",
                      publisherName: "CNN news")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
