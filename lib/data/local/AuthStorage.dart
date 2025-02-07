import 'package:insync_flutter/core/local/shared_preference.dart';
import 'package:insync_flutter/core/util/constants/preferences_values.dart';

class AuthStorage {

  final SharedPreferenceHelper _sharedPrefHelper;

  AuthStorage({required SharedPreferenceHelper secureStorage}): _sharedPrefHelper = secureStorage;

  Future<void> saveAccessToken(String accessToken) async {
      await _sharedPrefHelper.setSecureString(ACCESS_TOKEN, accessToken);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    await _sharedPrefHelper.setSecureString(REFRESH_TOKEN, refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _sharedPrefHelper.getSecureString(ACCESS_TOKEN);
  }

  Future<String?> getRefreshToken() async {
    return await _sharedPrefHelper.getSecureString(REFRESH_TOKEN);
  }
}