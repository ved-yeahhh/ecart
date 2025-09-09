import 'package:ecart/feature/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:ecart/feature/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain/usecases/save_onboarding_seen.dart';

Future<SaveOnboardingSeen> initOnboarding() async {
  final prefs = await SharedPreferences.getInstance();
  final localDataSource = OnboardingLocalDataSourceImpl(prefs: prefs);
  final repository = OnboardingRepositoryImpl(localDataSource);
  return SaveOnboardingSeen(repository);
}
