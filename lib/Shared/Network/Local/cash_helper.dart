import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? prefs;

  static init() async {
    return prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await prefs!.setString(key, value);
    }
    if (value is bool) {
      return await prefs!.setBool(key, value);
    }
    if (value is double) {
      return await prefs!.setDouble(key, value);
    }
    return await prefs!.setInt(key, value);
  }

  static dynamic getData({required String key}) {
    return prefs!.get(key);
  }

  static Future<bool> removeData() async {
    return await prefs!.clear();
  }
}
