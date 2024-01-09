import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tanara/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2), 
      () { 
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcomeScreen, (route) => false);
        
      }
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: Image.asset(
          "assets/tanara-icon.png",
          width: 158,
        ),
      ),
    );
  }
}