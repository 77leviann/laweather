import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _isFirstTimeKey = 'isFirstTime';

  static Future<SharedPreferences> _getPrefs() async =>
      await SharedPreferences.getInstance();

  static Future<bool> isFirstTime() async {
    final prefs = await _getPrefs();
    if (kDebugMode) {
      print('isFirstTime status has been updated to: $isFirstTime');
    }
    return prefs.getBool(_isFirstTimeKey) ?? true;
  }

  static Future<void> setFirstTime(bool isFirstTime) async {
    final prefs = await _getPrefs();
    await prefs.setBool(_isFirstTimeKey, isFirstTime);
  }
}
