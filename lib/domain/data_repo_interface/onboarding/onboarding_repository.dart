abstract class OnboardInterface {
  Future<bool> isOnboardComplete();
  Future<void> completeOnboard();
}