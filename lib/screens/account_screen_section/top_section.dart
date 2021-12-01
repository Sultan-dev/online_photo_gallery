//This for Account Screen widget

import 'package:challengeday1/components/avatar_image.dart';
import 'package:challengeday1/components/custom_text_button.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopSectionAccountScreen extends StatelessWidget {
  const TopSectionAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
          SizedBox(
            height: 5,
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
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
