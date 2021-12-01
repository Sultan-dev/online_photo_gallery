import 'package:challengeday1/classes/upload_photo.dart';
import 'package:challengeday1/classes/upload_photo_data.dart';
import 'package:challengeday1/components/custom_text_button.dart';
import 'package:challengeday1/components/upload_photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../utilities/constants.dart';
import '../components/custom_animated_bottom_bar.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';

class PhotoScreen extends StatefulWidget {
  static String id = 'photo_screen';
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  int _selectedIndex = 1;

  List<String> list = [
    HomeScreen.id,
    PhotoScreen.id,
    SearchScreen.id,
    AccountScreen.id,
  ];

// Changing the screen
  void changeScreen() {
    setState(() {
      Navigator.pushNamed(context, list[_selectedIndex]);
    });
  }

// bottom Navigation bar
  Widget _CustomNavigation() {
    return CustomAnimatedBottomBar(
      backgroundColor: kTextFieldColor,
      selectedIndex: _selectedIndex,
      curve: Curves.easeIn,
      items: [
        BottomNavyBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          title: Text(
            'Home',
          ),
          activeColor: kTextColor,
          inactiveColor: Color(0xff7170b2),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.photo_camera_outlined,
          ),
          title: Text(
            'Photo',
          ),
          activeColor: kTextColor,
          inactiveColor: Color(0xff7170b2),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.search_outlined,
          ),
          title: Text(
            'Search',
          ),
          activeColor: kTextColor,
          inactiveColor: Color(0xff7170b2),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
          ),
          title: Text(
            'Account',
          ),
          activeColor: kTextColor,
          inactiveColor: Color(0xff7170b2),
          textAlign: TextAlign.center,
        ),
      ],
      onItemSelected: (int value) {
        setState(() {
          _selectedIndex = value;
          changeScreen();
        });
      },
    );
  }

// image uploading
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Future _getImage(bool isClicked) async {
    XFile? image;
    if (isClicked) {
      image = await (_picker.pickImage(
          source: ImageSource.gallery, maxHeight: 400, maxWidth: 400));
    }
    setState(() {
      if (image != null) _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Upload your file',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'File should be jpg, png',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [10, 2],
                      radius: Radius.circular(9),
                      color: kTextColor,
                      strokeWidth: 3,
                      child: CustomTextButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_upload_outlined,
                              size: 28,
                              color: kTextColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Select your file',
                              style: TextStyle(
                                color: kTextColor.withOpacity(0.8),
                              ),
                            )
                          ],
                        ),
                        onPressed: () async {
                          await _getImage(true);
                          Provider.of<UploadPhotoData>(context, listen: false)
                              .addToList(UploadPhoto(image: _image!));
                        },
                        width: 343,
                        height: 125,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              (_image == null) ? Container() : UploadPhotoProvider(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _CustomNavigation(),
    );
  }
}
