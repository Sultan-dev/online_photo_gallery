class ImageClass {
  final String path;
  bool isChecked;

  ImageClass({required this.path, this.isChecked = false});

  void isToggled() {
    isChecked = !isChecked;
  }
}
