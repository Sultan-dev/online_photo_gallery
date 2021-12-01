import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../components/custom_animated_bottom_bar.dart';
import 'account_screen.dart';
import 'photo_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

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
      backgroundColor: kTextFieldColor,
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
          activeColor: kTextColor,
          inactiveColor: Color(0xff7170b2),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.photo_camera_outlined,
          ),
          title: Text(
            'Photo',
          ),
          activeColor: kTextColor,
          inactiveColor: Color(0xff7170b2),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.search_outlined,
          ),
          title: Text(
            'Search',
          ),
          activeColor: kTextColor,
          inactiveColor: Color(0xff7170b2),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
          ),
          title: Text(
            'Account',
          ),
          activeColor: kTextColor,
          inactiveColor: Color(0xff7170b2),
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
      body: Container(),
      bottomNavigationBar: _CustomNavigation(),
    );
  }
}
