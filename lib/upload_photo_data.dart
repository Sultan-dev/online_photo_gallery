import 'dart:collection';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'classes/upload_photo.dart';

class UploadPhotoData extends ChangeNotifier {
  final List<UploadPhoto> _list = [];

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

  String getFileName(int index){
    return _list[index].fileName;
  }

  UnmodifiableListView<UploadPhoto> getImage() {
    return UnmodifiableListView(_list);
  }
}
