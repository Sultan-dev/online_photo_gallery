// ignore_for_file: override_on_non_overriding_member
import 'package:challengeday1/components/main_text.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../components/custom_animated_bottom_bar.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'photo_screen.dart';
import 'search_screen_sections/bottom_section.dart';
import 'search_screen_sections/middle_section.dart';
import 'search_screen_sections/top_section.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 2;

  List<String> list = [
    HomeScreen.id,
    PhotoScreen.id,
    SearchScreen.id,
    AccountScreen.id,
  ];

  void changeScreen() {
    setState(() {
      Navigator.pushNamed(context, list[_selectedIndex]);
    });
  }

  Widget _CustomNavigation() {
    return CustomAnimatedBottomBar(
      backgroundColor: kTextColor,
      selectedIndex: _selectedIndex,
      curve: Curves.easeIn,
      items: [
        BottomNavyBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          title: Text(
            'Home',
          ),
          activeColor: Colors.white,
          inactiveColor: kInactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.photo_camera_outlined,
          ),
          title: Text(
            'Photo',
          ),
          activeColor: Colors.white,
          inactiveColor: kInactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.search_outlined,
          ),
          title: Text(
            'Search',
          ),
          activeColor: Colors.white,
          inactiveColor: kInactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
          ),
          title: Text(
            'Account',
          ),
          activeColor: Colors.white,
          inactiveColor: kInactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
      onItemSelected: (int value) {
        setState(() {
          _selectedIndex = value;
          changeScreen();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _CustomNavigation(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TopSectionSearchScreen(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 8,
                    ),
                    child: MainText(
                      text: 'Catagory',
                    ),
                  ),
                  MiddleSectionSearchScreen(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 8,
                      right: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainText(
                          text: 'Explore',
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Explore More!',
                            style: TextStyle(
                              textBaseline: TextBaseline.alphabetic,
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: kTextColor,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomSectionSearchScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
