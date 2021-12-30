import 'package:challengeday1/components/custom_text_button.dart';
import 'package:challengeday1/components/main_text.dart';
import 'package:challengeday1/components/scondary_text.dart';
import 'package:challengeday1/screens/sign_in_screen.dart';
import 'package:challengeday1/screens/sign_up_screen.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'Welcome_Screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainText(
                text: 'Welcome',
              ),
              SecondaryText(
                text: 'Join Now For Free and Show Your Work',
                sizedBoxHeight: 10,
              ),
              SizedBox(
                height: 50,
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
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.id);
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kTextColor,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  splashFactory: NoSplash.splashFactory,
                  side: BorderSide(
                    width: 2,
                    color: kTextColor,
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
