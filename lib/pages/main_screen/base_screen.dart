import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/pages/main_screen/bookmark.dart';
import 'package:news_app/pages/main_screen/discover.dart';
import 'package:news_app/pages/main_screen/homepage.dart';
import 'package:news_app/pages/main_screen/profile.dart';

// import 'package:line_icons/line_icons.dart';
class BaseScreen extends StatefulWidget {
  // const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    Discover(),
    // Bookmark(),
    // Profile()
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,

              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              // tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  // icon: Icon(),
                  // iconActiveColor:
                  //     Colors.blue, // Color when the button is active
                  iconColor: Colors.grey,
                  leading: Image.asset(
                    'assets/images/icons/home.png',
                    width: 30, // Adjust the size as needed
                    height: 34,
                  ),
                  // icon: FontAwesomeIcons.houseSignal,
                  text: 'Home',
                  textStyle: TextStyle(
                    fontSize: 16, // Set the font size
                    fontWeight: FontWeight.bold, // Set the font weight
                    // Set the text color
                  ),
                  icon: Icons.nat,
                ),
                GButton(
                  icon: Icons.nat,

                  // iconActiveColor:
                  //     Colors.blue, // Color when the button is active
                  iconColor: Colors.grey,
                  leading: Image.asset(
                    'assets/images/icons/bookmarkpng.png',
                    width: 30, // Adjust the size as needed
                    height: 34,
                  ),
                  // icon: FontAwesomeIcons.houseSignal,
                  text: 'Bookmark',
                  textStyle: TextStyle(
                    fontSize: 16, // Set the font size
                    fontWeight: FontWeight.bold, // Set the font weight
                    // Set the text color
                  ),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
