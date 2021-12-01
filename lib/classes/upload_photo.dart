import 'dart:io';

class UploadPhoto {
  final File image;
  bool isUploaded;

  UploadPhoto({required this.image, this.isUploaded = false});

  void uploadDone() {
    isUploaded = !isUploaded;
  }
}
