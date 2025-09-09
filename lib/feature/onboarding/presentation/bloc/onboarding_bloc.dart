import 'package:ecart/feature/onboarding/domain/usecases/save_onboarding_seen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final int totalPages;
  final SaveOnboardingSeen saveOnboardingSeen;

  OnboardingBloc({
    required this.totalPages,
    required this.saveOnboardingSeen,
  }) : super(OnboardingState()) {
    on<PageChanged>((event, emit) {
      emit(state.copyWith(currentPage: event.index));
    });

    on<NextPressed>((event, emit) {
      if (state.currentPage < totalPages - 1) {
        emit(state.copyWith(currentPage: state.currentPage + 1));
      }
    });

    on<SignInPressed>((event, emit) async {
      await _finishOnboarding(emit);
    });

    on<SignUpPressed>((event, emit) async {
      await _finishOnboarding(emit);
    });
  }

  Future<void> _finishOnboarding(Emitter<OnboardingState> emit) async {
    try {
      emit(state.copyWith(status: OnboardingStatus.inProgress));
      await saveOnboardingSeen();
      emit(state.copyWith(status: OnboardingStatus.completed));
    } catch (_) {
      emit(state.copyWith(status: OnboardingStatus.error));
    }
  }
}
