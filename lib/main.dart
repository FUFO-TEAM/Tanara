import 'package:flutter/material.dart';
import 'package:tanara/presentation/get_started.dart';
import 'package:tanara/presentation/register_page.dart';
import 'package:tanara/presentation/splash_page.dart';
import 'package:tanara/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.root,
    );
  }
}