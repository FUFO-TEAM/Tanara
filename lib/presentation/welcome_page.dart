import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tanara/shared/theme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool visible = false;
  @override
  void initState() {
    Timer(
      const Duration(seconds: 1),
      () {
        visible = true;
      }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget logoHeader() {
      return Container(
        width: 18,
        height: 35,
        margin: const EdgeInsets.only(
          left: 26,
          top: 30,
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "assets/tanara-icon-mini.png",
          ),
          fit: BoxFit.fill,
        )),
      );
    }

    Widget introText() {
      return Container(
        margin: const EdgeInsets.only(
          left: 26,
          top: 250,
          bottom: 275,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                "Selamat Datang di",
                style: blackTexStyle.copyWith(
                    fontWeight: bold, fontSize: 32, letterSpacing: 0),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "Tanara",
                  style: greenTexStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 40,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/plant-mini-icon.png",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget indicator() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(left: 5),
            decoration: const BoxDecoration(
              color: Color(0xff9FBF9A),
              shape: BoxShape.circle
            )
          ),
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(left: 5),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle
            )
          ),
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(left: 5),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle
            )
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(60, -120),
              child: Container(
                width: double.infinity,
                height: 700,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/welcome-background.png"),
                  fit: BoxFit.cover,
                ),),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                logoHeader(),
                introText(),
                indicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
