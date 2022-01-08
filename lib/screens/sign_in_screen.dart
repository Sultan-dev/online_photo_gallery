import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:challengeday1/exports/classes.dart' show GoogleSignInProvider;
import 'package:challengeday1/exports/components.dart'
    show CustomTextField, CustomTextButton, MainText, SecondaryText;
import 'package:challengeday1/exports/screens.dart'
    show AccountScreen, SignUpScreen;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:challengeday1/utilities/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'Sign_In_Screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  //firebase
  final _auth = FirebaseAuth.instance;

  //data
  late String email;
  late String password;
  bool showSpinner = false;
  bool visible = false;

  //controllers
  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;
  late final AnimationController _emailAnimationController;
  late final AnimationController _passwordAnimationController;
  late final Animation<double> _emailOffsetAnimation;
  late final Animation<double> _passwordOffsetAnimation;

  String defaulteEmailHintText = 'Email Address';
  String defaultPasswordHintText = 'Password';
  String _hintTextEmail = '';
  String _hintTextPassword = '';

  @override
  void initState() {
    _hintTextEmail = defaulteEmailHintText;
    _hintTextPassword = defaultPasswordHintText;

    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _emailAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 360,
      ),
    );
    _passwordAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 360,
      ),
    );

    _emailOffsetAnimation = Tween(
      begin: 0.0,
      end: kAnimationWidth,
    )
        .chain(CurveTween(
          curve: Curves.elasticIn,
        ))
        .animate(_emailAnimationController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _emailAnimationController.reverse();
          }
        },
      );
    _passwordOffsetAnimation = Tween(
      begin: 0.0,
      end: kAnimationWidth,
    )
        .chain(CurveTween(
          curve: Curves.elasticIn,
        ))
        .animate(_passwordAnimationController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _passwordAnimationController.reverse();
          }
        },
      );

    super.initState();
  }

  String checkTextField() {
    if (_emailTextController.text.isEmpty &&
        _passwordTextController.text.isEmpty) {
      return 'Both';
    } else if (_emailTextController.text.isEmpty) {
      return 'Email';
    } else if (_passwordTextController.text.isEmpty) {
      return 'Password';
    } else {
      return 'None';
    }
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _emailAnimationController.dispose();
    _passwordAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/backgroundImage.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 3.5,
                          sigmaY: 3.5,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText(
                                text: 'Sign In',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Welcom Back!',
                                style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SecondaryText(
                                text: 'Email',
                                sizedBoxHeight: 24,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AnimatedBuilder(
                                animation: _emailOffsetAnimation,
                                builder: (context, child) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: kAnimationWidth,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: _emailOffsetAnimation.value +
                                          kAnimationWidth,
                                      right: kAnimationWidth -
                                          _emailOffsetAnimation.value,
                                    ),
                                    child: TextField(
                                        controller: _emailTextController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          filled: false,
                                          hintText: _hintTextEmail,
                                          hintStyle: TextStyle(
                                            color: Colors.grey[600],
                                          ),
                                          prefixIcon: Icon(
                                            Icons.email_outlined,
                                            color: kTextColor,
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
                                          email = value;
                                        },
                                        onSubmitted: (value) {
                                          FocusScope.of(context).unfocus();
                                        }),
                                  );
                                },
                              ),
                              SecondaryText(
                                text: 'Password',
                                sizedBoxHeight: 10,
                              ),
                              AnimatedBuilder(
                                animation: _passwordOffsetAnimation,
                                builder: (context, child) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: kAnimationWidth,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: _passwordOffsetAnimation.value +
                                          kAnimationWidth,
                                      right: kAnimationWidth -
                                          _passwordOffsetAnimation.value,
                                    ),
                                    child: TextField(
                                      controller: _passwordTextController,
                                      obscureText: !visible,
                                      decoration: InputDecoration(
                                        filled: false,
                                        hintText: _hintTextPassword,
                                        hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock_outlined,
                                          color: kTextColor,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              visible = !visible;
                                            });
                                          },
                                          icon: Icon(
                                            visible
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: kTextColor,
                                          ),
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
                                        password = value;
                                      },
                                      onSubmitted: (value) {
                                        FocusScope.of(context).unfocus();
                                      },
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    // TODO: Action Required.
                                  },
                                  child: Text(
                                    'Forgot your Password?',
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
                              CustomTextButton(
                                child: Text(
                                  'Sign In',
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
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  if (checkTextField() == 'Both') {
                                    setState(() {
                                      _emailAnimationController.forward(
                                        from: 0.0,
                                      );
                                      _passwordAnimationController.forward(
                                        from: 0.0,
                                      );
                                      showSpinner = false;
                                      _hintTextEmail = 'Please fill the feild';
                                      _hintTextPassword =
                                          ' Please fill the field';
                                    });
                                    await Future.delayed(
                                      Duration(seconds: 3),
                                    );
                                    setState(() {
                                      _hintTextEmail = defaulteEmailHintText;
                                      _hintTextPassword =
                                          defaultPasswordHintText;
                                    });
                                  } else if (checkTextField() == 'Email') {
                                    setState(() {
                                      _emailAnimationController.forward(
                                        from: 0.0,
                                      );
                                      showSpinner = false;
                                      _hintTextEmail = 'Please fill the feild';
                                    });
                                    await Future.delayed(
                                      Duration(seconds: 3),
                                    );
                                    setState(() {
                                      _hintTextEmail = defaulteEmailHintText;
                                    });
                                  } else if (checkTextField() == 'Password') {
                                    setState(() {
                                      _passwordAnimationController.forward(
                                        from: 0.0,
                                      );
                                      showSpinner = false;
                                      _hintTextPassword =
                                          ' Please fill the field';
                                    });
                                    await Future.delayed(
                                      Duration(seconds: 3),
                                    );
                                    setState(() {
                                      _hintTextPassword =
                                          defaultPasswordHintText;
                                    });
                                  } else {
                                    try {
                                      final user = await _auth
                                          .signInWithEmailAndPassword(
                                              email: email.trim(),
                                              password: password.trim());
                                      if (user != null) {
                                        Navigator.popAndPushNamed(
                                            context, AccountScreen.id);
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                },
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, SignUpScreen.id);
                                  },
                                  child: Text(
                                    'Don\'t have an account?',
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Divider(
                                    thickness: 1,
                                  ),
                                  Text(
                                    'Or',
                                    style: TextStyle(
                                      color: kTextColor,
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'images/google_logo.png',
                                      ),
                                      width: 25,
                                      height: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Sign In with Google',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  final provider =
                                      Provider.of<GoogleSignInProvider>(context,
                                          listen: false);
                                  provider.googleLogin();
                                  Navigator.popAndPushNamed(
                                      context, AccountScreen.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
