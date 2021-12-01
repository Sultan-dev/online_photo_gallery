//This for Account Screen widget

import 'package:challengeday1/classes/upload_photo_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSectionAccountScreen extends StatelessWidget {
  const BottomSectionAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UploadPhotoData>(
      builder: (context, photoData, child) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: photoData.getNumberOfUploadedImages(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: FileImage(
                    photoData.getFileImage(index),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
/* GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (BuildContext context, int index) {},
    ) */