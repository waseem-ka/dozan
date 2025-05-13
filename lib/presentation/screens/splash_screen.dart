import 'package:dozan/Utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dozan/bloc/splash/splash_bloc.dart';
import 'package:dozan/presentation/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthenticated) {
          print('SplashAuthenticated');
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        } else if (state is SplashUnauthenticated) {
          print('SplashUnauthenticated');
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      },
      builder:
          (context, state) => Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: CustomColor.yallow),
            ),
          ),
    );
  }
}
