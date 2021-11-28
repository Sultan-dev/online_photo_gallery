import 'package:challengeday1/classes/upload_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../upload_photo_data.dart';
import '../utilities/constants.dart';
import '../utilities/custom_animated_bottom_bar.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';
import 'package:provider/provider.dart';

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

  late String _fileName = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _validInput = false;
  // Alert dialog
  Future<void> createAletDialog(BuildContext context, File image) async {
    TextEditingController controller = new TextEditingController();
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            contentPadding: EdgeInsets.all(0),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style:
                    TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _validInput = _formKey.currentState!.validate();
                    print(_validInput);
                    print(_fileName);
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: kTextFieldColor,
                  splashFactory: NoSplash.splashFactory,
                ),
              ),
            ],
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLength: 20,
                      controller: controller,
                      validator: (value) {
                        return value!.isNotEmpty ? null : 'Invalid Field';
                      },
                      onChanged: (value) {
                        _fileName = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter name of the photo',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

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

  void reFresh() {
    setState(() {});
  }

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
                      child: TextButton(
                        onPressed: () async {
                          _validInput = false;
                          _fileName = '';
                          await _getImage(true);
                          await createAletDialog(context, _image!);
                          Provider.of<UploadPhotoData>(context, listen: false)
                              .addToList(new UploadPhoto(
                                  fileName: _fileName, image: _image!));
                        },
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
                        style: TextButton.styleFrom(
                          backgroundColor: kTextFieldColor,
                          minimumSize: Size(343, 125),
                          splashFactory: NoSplash.splashFactory,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              (_image == null || !_validInput)
                  ? Container()
                  : Consumer<UploadPhotoData>(
                      builder: (context, uploadPhotoData, child) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  uploadPhotoData.getNumberOfUploadedImages(),
                              itemBuilder: (context, int index) {
                                final photo = uploadPhotoData.getImage();
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
                                              image: FileImage(uploadPhotoData
                                                  .getFileImage(index)),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          uploadPhotoData.getFileName(index),
                                          style: TextStyle(
                                            color: kTextColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _CustomNavigation(),
    );
  }
}
