import 'dart:ui';

import 'package:challengeday1/components/custom_text_button.dart';
import 'package:challengeday1/components/custom_text_field.dart';
import 'package:challengeday1/components/main_text.dart';
import 'package:challengeday1/components/scondary_text.dart';
import 'package:challengeday1/screens/account_screen.dart';
import 'package:challengeday1/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatelessWidget {
  static String id = 'Sign_In_Screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/backgroundImage.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 3.5,
                    sigmaY: 3.5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        MainText(
                          text: 'Sign In',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Welcom Back!',
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SecondaryText(
                          text: 'Email',
                          sizedBoxHeight: 24,
                        ),
                        CustomTextField(
                          text: 'Your Email Address',
                          prefixIcon: Icons.email_outlined,
                          isFilled: false,
                          sizedBoxHeight: 5,
                        ),
                        SecondaryText(
                          text: 'Password',
                          sizedBoxHeight: 10,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          text: 'Password',
                          prefixIcon: Icons.lock_outlined,
                          suffixIcon: Icons.visibility_off_outlined,
                          isFilled: false,
                          onPressed: () {
                            //TODO: Action Required.
                          },
                          sizedBoxHeight: 5,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // TODO: Action Required.
                            },
                            child: Text(
                              'Forgot your Password?',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                            ),
                          ),
                        ),
                        CustomTextButton(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.pushNamed(context, AccountScreen.id);
                          },
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignUpScreen.id);
                            },
                            child: Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 14,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Divider(
                              thickness: 1,
                            ),
                            Text(
                              'Or',
                              style: TextStyle(
                                color: kTextColor,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextButton(
                              child: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                              height: 55,
                              width: 140,
                              onPressed: () {
                                //TODO: Action Required.
                              },
                            ),
                            CustomTextButton(
                              child: Icon(
                                FontAwesomeIcons.facebook,
                                color: Colors.white,
                              ),
                              height: 55,
                              width: 140,
                              onPressed: () {
                                //TODO: Action Required.
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
