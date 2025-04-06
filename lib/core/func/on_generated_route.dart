import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/view/signin_view.dart';
import 'package:fruit_hub/features/auth/presentation/view/signup_view.dart';
import 'package:fruit_hub/features/onboard/presentation/view/onboard_view.dart';
import 'package:fruit_hub/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (builder) => const SplashView());
    case OnboardView.routeName:
      return MaterialPageRoute(builder: (builder) => const OnboardView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (builder) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (builder) => const SignupView());
    default:
      return MaterialPageRoute(builder: (builder) => const Scaffold());
  }
}
