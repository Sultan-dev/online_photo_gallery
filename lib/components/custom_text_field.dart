import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final prefixIcon;
  final suffixIcon;
  final onPressedIconButton;
  final double sizedBoxHeight;
  final onChanged;
  final bool secureText;

  const CustomTextField({
    required this.hintText,
    this.prefixIcon = null,
    this.suffixIcon = null,
    this.onPressedIconButton,
    required this.sizedBoxHeight,
    this.onChanged,
    this.secureText = false,
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
          obscureText: secureText,
          decoration: InputDecoration(
            filled: false,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: (prefixIcon != null) ? Icon(
              prefixIcon,
              color: kTextColor,
            ): null,
            suffixIcon: (suffixIcon != null)
                ? IconButton(
                    onPressed: onPressedIconButton,
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
          onChanged: onChanged,
        ),
      ],
    );
  }
}
