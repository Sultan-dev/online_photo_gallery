import 'package:challengeday1/classes/image_class.dart';

class ImageList {
  List<ImageClass> _list = [];

  void addToList(ImageClass image) {
    _list.add(image);
  }

  int getNumberOfImages() {
    return _list.length;
  }

  String getPath(int index) {
    return _list[index].path;
  }

  bool getIsChecked(int index) {
    return _list[index].isChecked;
  }

  void changeIsToggledProp(int index) {
    _list[index].isToggled();
  }
  
}
