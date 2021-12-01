import 'dart:collection';
import 'dart:io';
import 'package:challengeday1/classes/upload_photo.dart';
import 'package:flutter/foundation.dart';

class UploadPhotoData extends ChangeNotifier {
  List<UploadPhoto> _list = [];

  void addToList(UploadPhoto photo) {
    _list.add(photo);
    notifyListeners();
  }

  int getNumberOfUploadedImages() {
    return _list.length;
  }

  File getFileImage(int index) {
    return _list[index].image;
  }

  bool getIsUploaded(int index) {
    return _list[index].isUploaded;
  }

  void uploaded(int index) {
    _list[index].uploadDone();
    notifyListeners();
  }

  UnmodifiableListView<UploadPhoto> getUploadedPhoto() {
    return UnmodifiableListView(_list);
  }
}
