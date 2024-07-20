import 'package:flutter/material.dart';
import 'package:test_project/screens/onboarding/onboarding_screen.dart';

import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'onboarding',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'login':
            builder = (BuildContext context) => const LoginScreen();
            break;
          case 'signup':
            builder = (BuildContext context) => const SignUpScreen();
            break;
          case 'onboarding':
            builder = (BuildContext context) => const OnboardingScreen();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
