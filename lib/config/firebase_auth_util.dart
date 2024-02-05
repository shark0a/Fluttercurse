import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/const.dart';

class FirebaseAuthUtil {
  static Future<bool> loginIn(
      {required String email, required String password}) async {
    bool isLoggedIn = false;
    try {
      var userData = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      isLoggedIn = userData.user != null;
      if (isLoggedIn) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppSettings.usernameSharedPrefsKey, email);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
    return isLoggedIn;
  }

  static Future<bool> createAccount(
      {required String email, required String password}) async {
    bool isSignUp = false;
    try {
      var userData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      isSignUp = userData.user != null;
      if (isSignUp) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppSettings.usernameSharedPrefsKey, email);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
    return isSignUp;
  }
}
