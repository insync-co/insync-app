import 'package:insync_flutter/core/local/shared_preference.dart';
import 'package:insync_flutter/data/local/AuthStorage.dart';
import 'package:insync_flutter/data/local/UserStorage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UseCaseDI {
  static List<SingleChildWidget> providers = [
    ProxyProvider<SharedPreferences, UserStorage>(
        update: (context, sharedPreferences, previous)
        => UserStorage(sharedPreferences: sharedPreferences)
    ),

    ProxyProvider<SharedPreferenceHelper, AuthStorage>(
        update: (context, sharedPreferenceHelper, previous)
        => AuthStorage(secureStorage: sharedPreferenceHelper)
    ),
  ];
}
