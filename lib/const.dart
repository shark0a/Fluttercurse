import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static const String usernameSharedPrefsKey = "user_name";
  static Color mainAppColor = Colors.blue;
  static Future<String> getCashedusername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppSettings.usernameSharedPrefsKey) ?? "--";
  }
}
