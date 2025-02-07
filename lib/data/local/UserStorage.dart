import 'dart:convert';

import 'package:insync_flutter/core/util/constants/preferences_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/User.dart';

class UserStorage {

  final SharedPreferences _sharedPreferences;

  UserStorage({required SharedPreferences sharedPreferences}): _sharedPreferences = sharedPreferences;


  Future<void> saveUser(User user) async {
      await _sharedPreferences.setString(USER, jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async {
      String? userString = _sharedPreferences.getString(USER);
      if (userString != null) {
        return User.fromJson(jsonDecode(userString));
      }
      return null;
  }

}