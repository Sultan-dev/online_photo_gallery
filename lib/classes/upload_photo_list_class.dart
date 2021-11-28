import 'dart:io';

import 'package:challengeday1/classes/upload_photo.dart';

class UploadPhotoList {
  List<UploadPhoto> _list = [];

  void addToList(UploadPhoto photo) {
    _list.add(photo);
  }

  int getNumberOfUploadedImages() {
    return _list.length;
  }

  File getFileImage(int index) {
    return _list[index].image;
  }
}
