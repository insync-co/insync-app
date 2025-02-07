import 'package:insync_flutter/core/util/theme/ThemeManager.dart';
import 'package:insync_flutter/data/repository/auth/AuthRepository.dart';
import 'package:insync_flutter/domain/data_repo_interface/onboarding/onboarding_repository.dart';
import 'package:insync_flutter/presentation/view_models/auth/auth_view_model.dart';
import 'package:insync_flutter/presentation/view_models/onboard/onboard_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ViewModelDI {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ThemeManager>(
      create: (context) => ThemeManager(),
    ),

    ProxyProvider<OnboardInterface, OnboardViewModel>(
      update: (context, onboardingRepository, previous) =>
          OnboardViewModel(onboardInterface: onboardingRepository),
    ),

    ProxyProvider<AuthRepository, AuthViewModel>(
      update: (context, authRepo, previous) =>
          AuthViewModel(authRepo: authRepo),
    ),
  ];
}
