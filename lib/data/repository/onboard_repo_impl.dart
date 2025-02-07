import 'package:shared_preferences/shared_preferences.dart';

import '../../core/util/constants/preferences_values.dart';
import '../../domain/data_repo_interface/onboarding/onboarding_repository.dart';

class OnboardRepositoryImplementation implements OnboardInterface {
  late final SharedPreferences sharedPreferences;

  OnboardRepositoryImplementation({required this.sharedPreferences});

  @override
  Future<bool> isOnboardComplete() async {
    return sharedPreferences.getBool(ON_BOARDING_COMPLETE) ?? false;
  }

  @override
  Future<void> completeOnboard() async {
    await sharedPreferences.setBool(ON_BOARDING_COMPLETE, true);
  }
}