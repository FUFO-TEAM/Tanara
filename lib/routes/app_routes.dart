import 'package:flutter/material.dart';
import 'package:tanara/presentation/detail_tanaman.dart';
import 'package:tanara/presentation/home_page.dart';
import 'package:tanara/presentation/login_page.dart';
import 'package:tanara/presentation/main_page.dart';
import 'package:tanara/presentation/register_page.dart';
import 'package:tanara/presentation/rekomendasi_page.dart';
import 'package:tanara/presentation/rekomendasi_plant_page.dart';
import 'package:tanara/presentation/splash_page.dart';
import 'package:tanara/presentation/welcome_page.dart';

class AppRoutes {
  static const String root = '/';
  static const String registerScreen = '/register_screen';
  static const String loginScreen = '/login_screen';
  static const String welcomeScreen = '/welcome_screen';
  static const String rekomendasiScreen = '/rekomendasi_screen';
  static const String rekomendasiPlantScreen = '/rekomendasi_plant_screen';
  static const String detailPlantScreen = '/detail_plant_screen';
  static const String mainScreen = '/main_screen';

  static Map<String, WidgetBuilder> routes = {
    root: (context) => const SplashPage(),
    registerScreen: (context) => RegisterScreen(),
    loginScreen: (context) => LoginPage(),
    welcomeScreen: (context) => const WelcomePage(),
    rekomendasiScreen: (context) => const RekomendasiPage(),
    mainScreen: (context) => const MainPage()
  };
}
