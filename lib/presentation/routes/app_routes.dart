import 'package:flutter/material.dart';
import 'package:dozan/presentation/screens/home_screen.dart';
import 'package:dozan/presentation/screens/onboarding.dart';
import 'package:dozan/presentation/screens/auth/login_screen.dart';
import 'package:dozan/presentation/screens/auth/otp.dart';
import 'package:dozan/presentation/screens/auth/provider_career.dart';
import 'package:dozan/presentation/screens/auth/register_screen_customer.dart';
import 'package:dozan/presentation/screens/auth/register_screen_provider.dart';
import 'package:dozan/presentation/screens/auth/register_type.dart';

class AppRoutes {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String providerCareer = '/providerCareer';
  static const String registerCustomer = '/registerCustomer';
  static const String registerProvider = '/registerProvider';
  static const String registerType = '/registerType';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case otp:
        return MaterialPageRoute(builder: (_) => OtpPage());
      case providerCareer:
        return MaterialPageRoute(builder: (_) => ProviderRegisterPage());
      case registerCustomer:
        return MaterialPageRoute(builder: (_) => RegisterCustomer());
      case registerProvider:
        return MaterialPageRoute(builder: (_) => RegisterProvider());
      case registerType:
        return MaterialPageRoute(builder: (_) => RegisterType());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen()); // Default route
    }
  }
}
