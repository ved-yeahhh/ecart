abstract class OnboardingRepository {
  Future<void> saveOnboardingSeen();
  Future<bool> isOnboardingSeen();
}
