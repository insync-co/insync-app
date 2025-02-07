import 'package:flutter/material.dart';
import 'package:insync_flutter/domain/data_repo_interface/onboarding/onboarding_repository.dart';

class OnboardViewModel extends ChangeNotifier {
  final OnboardInterface onboardInterface;

  OnboardViewModel({required this.onboardInterface});

  bool _isOnboardCompleted = false;
  bool get isOnboardCompleted => _isOnboardCompleted;

  Future<void> checkOnboardStatus() async {
    _isOnboardCompleted = await onboardInterface.isOnboardComplete();
    notifyListeners();
  }

  Future<void> completeOnboard() async {
    await onboardInterface.completeOnboard();
    _isOnboardCompleted = true;
    notifyListeners();
  }
}