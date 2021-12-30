import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconData prefixIcon;
  final fillColor;
  final suffixIcon;
  final onPressed;
  final bool isFilled;
  final double sizedBoxHeight;
  const CustomTextField({
    required this.text,
    required this.prefixIcon,
    this.fillColor = null,
    this.suffixIcon = null,
    this.onPressed,
    required this.isFilled,
    required this.sizedBoxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizedBoxHeight,
        ),
        TextField(
          style: TextStyle(
            fontSize: 12,
            color: kTextColor,
          ),
          obscuringCharacter: '*',
          obscureText: true,
          decoration: InputDecoration(
            filled: isFilled,
            fillColor: fillColor,
            hintText: text,
            hintStyle: TextStyle(
              color: kTextColor,
            ),
            //fillColor: kTextFieldColor,
            prefixIcon: Icon(
              prefixIcon,
              color: kTextColor,
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      suffixIcon,
                      color: kTextColor,
                    ),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: kTextColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: kTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
