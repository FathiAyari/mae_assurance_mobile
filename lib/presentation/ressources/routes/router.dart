import 'package:flutter/material.dart';
import 'package:mae_assurance_mobile/presentation/client/screens/auth/reset_password.dart';
import 'package:mae_assurance_mobile/presentation/client/screens/auth/sign_in.dart';
import 'package:mae_assurance_mobile/presentation/client/screens/auth/sign_up.dart';
import 'package:mae_assurance_mobile/presentation/client/screens/on_boarding/on_boarding_page.dart';
import 'package:mae_assurance_mobile/presentation/client/screens/splash_screen/splashscreen.dart';

class AppRouting {
  static final String splashScreen = "/";
  static final String signIn = "/sign_in";
  static final String signUp = "/sign_up";
  static final String resetPassword = "/reset_password";
  static final String onboarding = "/onboarding";
  static final String AccountInHold = "/account_in_hold";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
      case '/sign_in':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/sign_up':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/reset_password':
        return MaterialPageRoute(builder: (_) => ResetPassword());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
