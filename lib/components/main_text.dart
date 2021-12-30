import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final String text;
  final double fontSize;
  const MainText({
    required this.text,
    this.fontSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: kTextColor,
      ),
    );
  }
}
