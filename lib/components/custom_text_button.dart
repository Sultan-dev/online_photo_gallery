import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final onPressed;
  final Widget child;
  final double height;
  final double width;

  CustomTextButton(
      {required this.child,
      required this.height,
      required this.width,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: TextButton.styleFrom(
        backgroundColor: kTextFieldColor,
        minimumSize: Size(width, height),
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}
