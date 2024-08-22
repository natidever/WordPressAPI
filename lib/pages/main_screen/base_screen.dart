import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:line_icons/line_icons.dart';
class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('GoogleNavBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                  // iconActiveColor:
                  //     Colors.blue, // Color when the button is active
                  iconColor: Colors.grey,
                  leading: Image.asset(
                    'assets/images/icons/home.png',
                    width: 30, // Adjust the size as needed
                    height: 34,
                  ),
                  icon: FontAwesomeIcons.houseSignal,
                  text: 'Home',
                  textStyle: TextStyle(
                    fontSize: 16, // Set the font size
                    fontWeight: FontWeight.bold, // Set the font weight
                    // Set the text color
                  ),
                ),
                GButton(
                  // iconActiveColor:
                  //     Colors.blue, // Color when the button is active
                  iconColor: Colors.grey,
                  leading: Image.asset(
                    'assets/images/icons/discover.png',
                    width: 30, // Adjust the size as needed
                    height: 34,
                  ),
                  icon: FontAwesomeIcons.houseSignal,
                  text: 'Discover',
                  textStyle: TextStyle(
                    fontSize: 16, // Set the font size
                    fontWeight: FontWeight.bold, // Set the font weight
                    // Set the text color
                  ),
                ),
                GButton(
                  // iconActiveColor:
                  //     Colors.blue, // Color when the button is active
                  iconColor: Colors.grey,
                  leading: Image.asset(
                    'assets/images/icons/bookmarkpng.png',
                    width: 30, // Adjust the size as needed
                    height: 34,
                  ),
                  icon: FontAwesomeIcons.houseSignal,
                  text: 'Bookmark',
                  textStyle: TextStyle(
                    fontSize: 16, // Set the font size
                    fontWeight: FontWeight.bold, // Set the font weight
                    // Set the text color
                  ),
                ),
                GButton(
                  // iconActiveColor:
                  //     Colors.blue, // Color when the button is active
                  iconColor: Colors.grey,
                  leading: Image.asset(
                    'assets/images/icons/profile.png',
                    width: 30, // Adjust the size as needed
                    height: 34,
                  ),
                  icon: FontAwesomeIcons.houseSignal,
                  text: 'Profile',
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