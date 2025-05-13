import 'package:dozan/bloc/onboarding/onboarding_bloc.dart';
import 'package:dozan/presentation/routes/app_routes.dart';
import 'package:dozan/presentation/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => OnboardingBloc(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.onboarding, // أو أي صفحة تبلّش منها
            onGenerateRoute: AppRoutes.generateRoute,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Cairo',
            ),
            home: child,
          ),
        );
      },
    );
  }
}
