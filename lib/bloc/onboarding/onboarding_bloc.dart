import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController = PageController();

  OnboardingBloc() : super(OnboardingState(currentPage: 0)) {
    on<NextPage>((event, emit) {
      if (state.currentPage < 2) {
        pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        emit(state.copyWith(currentPage: state.currentPage + 1));
      }
    });
    on<CompleteOnboarding>((event, emit) {});

    on<PreviousPage>((event, emit) {
      if (state.currentPage > 0) {
        pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        emit(state.copyWith(currentPage: state.currentPage - 1));
      }
    });

    on<SkipOnboarding>((event, emit) {
      pageController.jumpToPage(2);
      emit(state.copyWith(currentPage: 2));
    });

    on<PageChanged>((event, emit) {
      emit(state.copyWith(currentPage: event.page));
    });
  }
}
