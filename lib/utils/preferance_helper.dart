import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static String keyLanguage = "language";
  static String keyIsLogin = "IsLogin";
  static String keyIsFirstTime = "IsFirstTime";

// Write DATA
  static Future<bool> saveData(key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }else{
      return await sharedPreferences.setStringList(key, value);
    }
  }

// Read Data
  static  getData(key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }
  static getString(String key) async {
    String stringValue="";
  await SharedPreferences.getInstance().then((sharedPreferences) => (value) {
      stringValue = sharedPreferences.getString(key)??"";
    });

    return stringValue;
  }
}
