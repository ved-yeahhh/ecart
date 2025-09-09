
import 'package:ecart/feature/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:ecart/feature/onboarding/domain/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveOnboardingSeen() async {
    await localDataSource.saveOnboardingSeen();
  }

  @override
  Future<bool> isOnboardingSeen() async {
    return await localDataSource.isOnboardingSeen();
  }
}
