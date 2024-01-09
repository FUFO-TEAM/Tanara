import 'package:flutter/material.dart';
import 'package:tanara/presentation/login_page.dart';
import 'package:tanara/presentation/register_page.dart';
import 'package:tanara/presentation/splash_page.dart';
import 'package:tanara/presentation/welcome_page.dart';

class AppRoutes {
  static const String root = '/';
  static const String registerScreen = '/register_screen';
  static const String loginScreen = '/login_screen';
  static const String welcomeScreen = '/welcome_screen';

  static Map<String, WidgetBuilder> routes = {
    root: (context) => const SplashPage(),
    registerScreen: (context) => const RegisterScreen(),
    loginScreen: (context) => const LoginPage(),
    welcomeScreen: (context) => const WelcomePage(),
  };
}
