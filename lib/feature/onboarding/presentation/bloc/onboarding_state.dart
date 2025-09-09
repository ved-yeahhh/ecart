import 'package:equatable/equatable.dart';

enum OnboardingStatus { initial, inProgress, completed, error }

class OnboardingState extends Equatable {
  final int currentPage;
  final OnboardingStatus status;

  const OnboardingState({
    this.currentPage = 0,
    this.status = OnboardingStatus.initial,
  });

  OnboardingState copyWith({
    int? currentPage,
    OnboardingStatus? status,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [currentPage, status];
}
