import 'package:dozan/bloc/onboarding/onboarding_bloc.dart';
import 'package:dozan/presentation/screens/navigation/main_navigation_screen.dart';
import 'package:dozan/presentation/screens/onboarding.dart';
import 'package:dozan/presentation/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dozan/bloc/splash/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthenticated) {
          debugPrint('SplashAuthenticated');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => MainNavigationScreen()),
          );
        } else if (state is SplashUnauthenticated) {
          debugPrint('SplashUnauthenticated');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => BlocProvider(
                    create: (_) => OnboardingBloc(),
                    child: OnboardingScreen(),
                  ),
            ),
          );
        }
      },
      builder:
          (context, state) =>
              Scaffold(body: Center(child: SpinningImageLoader())),
    );
  }
}
