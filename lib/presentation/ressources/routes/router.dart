import 'package:flutter/material.dart';
import 'package:mae_assurance_mobile/presentation/client/screens/on_boarding/on_boarding_page.dart';
import 'package:mae_assurance_mobile/presentation/client/screens/splash_screen/splashscreen.dart';

class AppRouting {
  static final String splashScreen = "/";
  static final String login = "/login";
  static final String register = "/register";
  static final String onboarding = "/onboarding";
  static final String homeClient = "/home_client";
  static final String homeAdmin = "/home_admin";
  static final String deletedAccount = "/deleted_account";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnBoardingPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
