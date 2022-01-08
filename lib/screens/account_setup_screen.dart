import 'dart:io';
import 'package:challengeday1/components/avatar_image.dart';
import 'package:challengeday1/components/custom_text_button.dart';
import 'package:challengeday1/components/custom_text_field.dart';
import 'package:challengeday1/components/main_text.dart';
import 'package:challengeday1/components/scondary_text.dart';
import 'package:challengeday1/screens/account_screen.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AccountSetupScreen extends StatefulWidget {
  static String id = 'Account_Setup_Screen';
  const AccountSetupScreen({Key? key}) : super(key: key);

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  //firebase.
  final _auth = FirebaseAuth.instance;
  final _cloud = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  User? _user;

  //data.
  String gender = 'Select';
  String name = '';
  String description = '';
  String instagramAccount = '';
  String paypalAccount = '';
  String twitterAccount = '';

  bool showSpinner = false;

  // image uploading.
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Future<void> _getImage(bool isClicked) async {
    XFile? image;
    if (isClicked) {
      image = await (_picker.pickImage(
          source: ImageSource.gallery, maxHeight: 400, maxWidth: 400));
    }
    setState(() {
      if (image != null) _image = File(image.path);
    });
  }

  //to set the image to default if the user don't want.
  Widget defaultBackground() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(80),
      ),
      child: Icon(
        Icons.photo_camera_outlined,
        color: Colors.grey[800],
        size: 35,
      ),
    );
  }

  @override
  void initState() {
    _user = _auth.currentUser!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    text: 'Account Setup',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () async {
                        await _getImage(true);
                      },
                      child: (_image != null)
                          ? AvatarImage(
                              image: FileImage(_image!),
                            )
                          : defaultBackground(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _image = null;
                          defaultBackground();
                        });
                      },
                      child: Text(
                        'Set default',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                  ),
                  SecondaryText(
                    text: 'Name',
                    sizedBoxHeight: 10,
                  ),
                  CustomTextField(
                    hintText: 'Your Name',
                    prefixIcon: Icons.person_outlined,
                    sizedBoxHeight: 5,
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  SecondaryText(
                    text: 'Gender',
                    sizedBoxHeight: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kTextColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: gender,
                        icon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.arrow_drop_down_outlined,
                            color: kTextColor,
                          ),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                          color: kTextColor,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            gender = newValue!;
                          });
                        },
                        items: <String>['Select', 'Male', 'Female']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SecondaryText(
                    text: 'Description',
                    sizedBoxHeight: 24,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    maxLength: 150,
                    maxLines: 3,
                    buildCounter: (_,
                            {required currentLength,
                            maxLength,
                            required isFocused}) =>
                        Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          currentLength.toString() + "/" + maxLength.toString(),
                        ),
                      ),
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      hintText: "Description..",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: kTextColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: kTextColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  SecondaryText(
                    text: 'Instagram Account',
                    sizedBoxHeight: 24,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: false,
                      hintText: "https://..",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: kTextColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: kTextColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      instagramAccount = value;
                    },
                  ),
                  SecondaryText(
                    text: 'Paypal Account',
                    sizedBoxHeight: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: false,
                      hintText: "https://..",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: kTextColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: kTextColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      paypalAccount = value;
                    },
                  ),
                  SecondaryText(
                    text: 'Twitter Account',
                    sizedBoxHeight: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: false,
                      hintText: "https://..",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: kTextColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: kTextColor,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      twitterAccount = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    color: kTextColor,
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        _cloud.collection('users').doc(_user!.uid).set(
                          {
                            'name': '${name}',
                            'gender': '${gender}',
                            'description': '${description}',
                            'instagramAccount': '${instagramAccount}',
                            'paypalAccount': '${paypalAccount}',
                            'twitterAccount': '${twitterAccount}',
                          },
                          SetOptions(
                            merge: true,
                          ),
                        ).then(
                          (_) => print('success!'),
                        );

                        if (_image != null) {
                          Reference ref = _storage.ref();
                          TaskSnapshot addImage = await ref
                              .child('image/profileImage')
                              .putFile(_image!);

                          if (addImage.state == TaskState.success) {
                            print('added to firebase storage');

                            final String downloadURL =
                                await addImage.ref.getDownloadURL();

                            await _cloud
                                .collection('profileImages')
                                .doc(_user!.uid)
                                .set(
                              {
                                'URL': downloadURL,
                              },
                              SetOptions(
                                merge: true,
                              ),
                            );
                          }
                        }
                        Navigator.popAndPushNamed(context, AccountScreen.id);
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
