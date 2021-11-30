import 'package:challengeday1/classes/upload_photo.dart';
import 'package:challengeday1/classes/upload_photo_list_class.dart';
import 'package:challengeday1/components/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utilities/constants.dart';
import '../components/custom_animated_bottom_bar.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';
import 'package:percent_indicator/percent_indicator.dart';

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

  UploadPhotoList uploadPhotoList = UploadPhotoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          uploadPhotoList
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
              (_image == null)
                  ? Container()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount:
                              uploadPhotoList.getNumberOfUploadedImages(),
                          itemBuilder: (context, int index) {
                            return Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.0,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(
                                            uploadPhotoList.getFileImage(index),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    LinearPercentIndicator(
                                      percent: 1,
                                      width: 225,
                                      lineHeight: 9,
                                      animateFromLastPercent: true,
                                      backgroundColor: kInactiveColor,
                                      progressColor: kTextColor,
                                      animation: true,
                                      animationDuration: 3500,
                                      onAnimationEnd: () {
                                        final snackBar = SnackBar(
                                          duration: Duration(
                                            milliseconds: 3000,
                                          ),
                                          content: Text(
                                            'Photo uploaded successfully!',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          backgroundColor: Colors.green,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _CustomNavigation(),
    );
  }
}
