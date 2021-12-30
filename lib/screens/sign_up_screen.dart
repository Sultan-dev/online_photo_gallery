import 'dart:ui';

import 'package:challengeday1/components/custom_text_button.dart';
import 'package:challengeday1/components/custom_text_field.dart';
import 'package:challengeday1/components/main_text.dart';
import 'package:challengeday1/components/scondary_text.dart';
import 'package:challengeday1/screens/account_screen.dart';
import 'package:challengeday1/screens/sign_in_screen.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'Sign_Up_Screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                          MainText(
                            text: 'Sign Up',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Join Now and Show the World Your Art!.',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SecondaryText(
                            text: 'Name',
                            sizedBoxHeight: 24,
                          ),
                          CustomTextField(
                            text: 'Your Name',
                            prefixIcon: Icons.person_outlined,
                            isFilled: false,
                            sizedBoxHeight: 5,
                          ),
                          SecondaryText(
                            text: 'Email',
                            sizedBoxHeight: 10,
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
                          SecondaryText(
                            text: 'Confirm Password',
                            sizedBoxHeight: 10,
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
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextButton(
                            child: Text(
                              'Sign Up',
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
                                Navigator.pushNamed(context, SignInScreen.id);
                              },
                              child: Text(
                                'Already have an account?',
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
      ),
    );
  }
}
