import 'package:challengeday1/classes/upload_photo.dart';
import 'package:challengeday1/classes/upload_photo_data.dart';
import 'package:challengeday1/components/custom_text_button.dart';
import 'package:challengeday1/components/main_text.dart';
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
      backgroundColor: kTextColor,
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
          activeColor: Colors.white,
          inactiveColor: kInactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.photo_camera_outlined,
          ),
          title: Text(
            'Photo',
          ),
          activeColor: Colors.white,
          inactiveColor: kInactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.search_outlined,
          ),
          title: Text(
            'Search',
          ),
          activeColor: Colors.white,
          inactiveColor: kInactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
          ),
          title: Text(
            'Account',
          ),
          activeColor: Colors.white,
          inactiveColor: kInactiveColor,
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MainText(
                      text: 'Upload your file',
                      fontSize: 20,
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
                    CustomTextButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_upload_outlined,
                            size: 32,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Select your file',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      onPressed: () async {
                        await _getImage(true);
                        Provider.of<UploadPhotoData>(context, listen: false)
                            .addToList(UploadPhoto(image: _image!));
                      },
                      width: MediaQuery.of(context).size.width,
                      height: 125,
                    ),
                  ],
                ),
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
