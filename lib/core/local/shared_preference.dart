import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {

  static SharedPreferences? _pref;
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _pref?.setString(key, value);
  }

  Future<void> setSecureString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  String? getString(String key) {
    return _pref?.getString(key);
  }

  Future<String?> getSecureString(String key) async {
    return await _secureStorage.read(key: key);
  }
}