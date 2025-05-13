part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent {}

class NextPage extends OnboardingEvent {}

class PreviousPage extends OnboardingEvent {}

class SkipOnboarding extends OnboardingEvent {}

class PageChanged extends OnboardingEvent {
  final int page;

  PageChanged({required this.page});
}

class CompleteOnboarding extends OnboardingEvent {}
