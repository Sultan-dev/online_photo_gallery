//This for Search Screen widget

import 'package:challengeday1/components/avatar_image.dart';
import 'package:challengeday1/components/custom_text_field.dart';
import 'package:challengeday1/components/main_text.dart';
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
              MainText(
                text: 'Find Inspriation\nPhotos',
              ),
              AvatarImage(
                image: AssetImage(
                  'images/avatar.jpeg',
                ),
              ),
            ],
          ),
          CustomTextField(
            prefixIcon: Icons.search_outlined,
            hintText: 'Search photos ...',
            sizedBoxHeight: 20,
          ),
        ],
      ),
    );
  }
}
