import 'package:insync_flutter/core/local/shared_preference.dart';
import 'package:insync_flutter/core/network/api_service.dart';
import 'package:insync_flutter/data/repository/auth/AuthRepository.dart';
import 'package:insync_flutter/domain/data_repo_interface/auth/auth_interface.dart';
import 'package:insync_flutter/domain/data_repo_interface/onboarding/onboarding_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/onboard_repo_impl.dart';

const baseUrl = "http://localhost:8000";

class RepositoryDI {
  static List<SingleChildWidget> providers = [
    Provider<ApiService>(create: (_) => ApiService(baseUrl: baseUrl)),
    Provider<SharedPreferenceHelper>(create: (_) => SharedPreferenceHelper()),

    ProxyProvider<SharedPreferences, OnboardInterface>(
        update: (context, sharedPreferences, previous)
        => OnboardRepositoryImplementation(sharedPreferences: sharedPreferences)
    ),

    ProxyProvider<SharedPreferenceHelper, AuthInterface>(
        update: (context, sharedPreferences, previous)
        => AuthRepository(sharedPrefHelper: sharedPreferences)
    )
  ];
}