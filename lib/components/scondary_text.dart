import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';

class SecondaryText extends StatelessWidget {
  final String text;
  final double sizedBoxHeight;
  final double fontSize;
  const SecondaryText({
    required this.text,
    this.sizedBoxHeight = 0,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: kTextColor,
          ),
        ),
      ],
    );
  }
}
