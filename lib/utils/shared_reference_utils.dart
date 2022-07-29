import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFactory {
  static late SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async =>
      _prefsInstance = await SharedPreferences.getInstance();

  static String getString(String key, [String defValue = ""]) {
    return _prefsInstance?.getString(key) ?? defValue;
  }

  static Future<bool> setString(String key, String value) async {
    return _prefsInstance?.setString(key, value) ?? Future.value(false);
  }
}

class SharedPreferencesUtils {
  static String JSON_ADD_CARD_KEY = "json_add_card_key";

  static Future<bool> setJsonCard(String json) async {
    return SharedPreferencesFactory.setString(JSON_ADD_CARD_KEY, json);
  }

  static String getJsonCard() {
    return SharedPreferencesFactory.getString(JSON_ADD_CARD_KEY);
  }
}
