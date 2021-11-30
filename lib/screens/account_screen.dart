import 'package:challengeday1/components/avatar_image.dart';
import 'package:challengeday1/components/custom_text_button.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:challengeday1/screens/search_screen.dart';
import 'package:flutter/material.dart';
import '../components/custom_animated_bottom_bar.dart';
import 'home_screen.dart';
import 'photo_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatefulWidget {
  static String id = 'account_screen';
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 3;

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sultan',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        color: kTextColor,
                        size: 28,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.menu_outlined,
                        color: kTextColor,
                        size: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AvatarImage(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sultan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kTextColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Capturing rare moments somtimes is hard, but the outcome is wonderful!.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.grey.withOpacity(0.7),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Instagram',
                        style: TextStyle(
                          fontSize: 12,
                          color: kTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 16,
                        color: kTextColor,
                      ),
                    ],
                  ),
                  height: 30,
                  width: 70,
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                CustomTextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Donate',
                        style: TextStyle(
                          fontSize: 12,
                          color: kTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FaIcon(
                        FontAwesomeIcons.paypal,
                        size: 16,
                        color: kTextColor,
                      ),
                    ],
                  ),
                  height: 30,
                  width: 90,
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                CustomTextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Twitter',
                        style: TextStyle(
                          fontSize: 12,
                          color: kTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FaIcon(
                        FontAwesomeIcons.twitter,
                        size: 16,
                        color: kTextColor,
                      ),
                    ],
                  ),
                  height: 30,
                  width: 90,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _CustomNavigation(),
    );
  }
}
