import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount getGoogleSignInAccount() {
    return _user!;
  }

  Future<void> googleLogin() async {
    final googleUser = await _googleSignIn.signIn();

    try {
      if (googleUser != null) {
        _user = googleUser;
        final googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        notifyListeners();
        
      }
    } catch (e) {
      print(e);
    }
  }
}
