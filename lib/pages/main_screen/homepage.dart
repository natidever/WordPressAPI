import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_buttons.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionBarButton(iconFound: true, icon: Icons.menu),
                    ActionBarButton(
                        iconFound: false,
                        imageSource: 'assets/images/icons/notification.png')
                  ],
                ),
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [Text('Home page')],
        ),
      ),
    );
  }
}
