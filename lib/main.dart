import 'package:dozan/bloc/splash/splash_bloc.dart';
import 'package:dozan/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.getInstance;
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
          create: (context) => SplashBloc()..add(CheckLoginStatus()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
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
