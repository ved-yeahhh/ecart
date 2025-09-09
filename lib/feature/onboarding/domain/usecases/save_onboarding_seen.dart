
import 'package:ecart/feature/onboarding/domain/repository/onboarding_repository.dart';

class SaveOnboardingSeen {
  final OnboardingRepository repository;

  SaveOnboardingSeen(this.repository);

  Future<void> call() async {
    await repository.saveOnboardingSeen();
  }
}
