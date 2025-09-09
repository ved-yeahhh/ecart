import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDataSource {
  Future<void> saveOnboardingSeen();
  Future<bool> isOnboardingSeen();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences prefs;

  OnboardingLocalDataSourceImpl({required this.prefs});

  @override
  Future<void> saveOnboardingSeen() async {
    await prefs.setBool("onboarding_seen", true);
  }

  @override
  Future<bool> isOnboardingSeen() async {
    return prefs.getBool("onboarding_seen") ?? false;
  }
}
