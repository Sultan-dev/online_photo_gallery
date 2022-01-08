import 'package:challengeday1/classes/google_signin_provider.dart';
import 'package:challengeday1/classes/upload_photo_data.dart';
import 'package:challengeday1/screens/account_screen.dart';
import 'package:challengeday1/screens/account_setup_screen.dart';
import 'package:challengeday1/screens/home_screen.dart';
import 'package:challengeday1/screens/photo_screen.dart';
import 'package:challengeday1/screens/sign_in_screen.dart';
import 'package:challengeday1/screens/sign_up_screen.dart';
import 'package:challengeday1/screens/verify_screen.dart';
import 'package:challengeday1/screens/welcome_screen.dart';
import 'package:challengeday1/utilities/no_glow_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UploadPhotoData>(
          create: (context) => UploadPhotoData(),
        ),
        Provider<GoogleSignInProvider>(
          create: (context) => GoogleSignInProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          backgroundColor: Colors.white,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          SearchScreen.id: (context) => SearchScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          PhotoScreen.id: (context) => PhotoScreen(),
          AccountScreen.id: (context) => AccountScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          VerifyScreen.id: (context) => VerifyScreen(),
          AccountSetupScreen.id: (context) => AccountSetupScreen(),
        },
        builder: (context, child) {
          return ScrollConfiguration(behavior: NoGlowBehavior(), child: child!);
        },
      ),
    );
  }
}
