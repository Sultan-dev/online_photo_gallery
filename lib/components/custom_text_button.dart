import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final onPressed;
  final Widget child;
  final double height;
  final double width;
  final double borderRadius;
  final color;
  CustomTextButton({
    required this.child,
    required this.height,
    required this.width,
    this.onPressed,
    this.borderRadius = 15,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: TextButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}
