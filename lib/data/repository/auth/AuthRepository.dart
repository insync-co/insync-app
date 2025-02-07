import 'package:insync_flutter/core/local/shared_preference.dart';
import 'package:insync_flutter/domain/data_repo_interface/auth/auth_interface.dart';

class AuthRepository implements AuthInterface {

  final SharedPreferenceHelper _sharedPreferenceHelper;

  AuthRepository({required SharedPreferenceHelper sharedPrefHelper}) : _sharedPreferenceHelper = sharedPrefHelper;

  @override
  Future<void> getPrimaryEmail() {
    // TODO: implement getPrimaryEmail
    throw UnimplementedError();
  }

  @override
  Future<void> googleSignIn() async {
    Future.delayed(const Duration(seconds: 2));
    return;
  }

  @override
  Future<void> googleSignOut() {
    // TODO: implement googleSignOut
    throw UnimplementedError();
  }

  @override
  Future<void> setPrimaryEmail() {
    // TODO: implement setPrimaryEmail
    throw UnimplementedError();
  }

}