//This for Search Screen widget

import 'package:challengeday1/components/avatar_image.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:flutter/material.dart';

class TopSectionSearchScreen extends StatelessWidget {
  const TopSectionSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find Inspriation\nPhotos',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: kTextColor,
                ),
              ),
              AvatarImage(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            style: TextStyle(
              fontSize: 12,
              color: kTextColor,
            ),
            decoration: InputDecoration(
              hintText: 'Search photos ...',
              hintStyle: TextStyle(
                color: kTextColor,
              ),
              fillColor: kTextFieldColor,
              filled: true,
              prefixIcon: Icon(
                Icons.search_outlined,
                color: kTextColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: kTextFieldColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Color(0xffd9e1fc),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
