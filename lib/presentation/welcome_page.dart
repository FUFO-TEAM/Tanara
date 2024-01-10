import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tanara/routes/app_routes.dart';
import 'package:tanara/shared/theme.dart';
import 'package:tanara/widgets/custom_text_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _indexContent = 0;

  bool visible = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        visible = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _updateIndex(int delta) {
      setState(() {
        _indexContent += delta;
      });
    }

    Widget logoHeader() {
      return Container(
        width: 18,
        height: 35,
        margin: const EdgeInsets.only(
          top: 30,
          left: 26,
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
      List textContents = [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _indexContent == 0 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 800),
              child: Text(
                "Selamat Datang di",
                style: blackTexStyle.copyWith(
                    fontWeight: bold, fontSize: 32, letterSpacing: 0),
              ),
            ),
            const SizedBox(height: 5),
            AnimatedOpacity(
              opacity: _indexContent == 0 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: Row(
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
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: _indexContent == 1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: Text(
                "Tanara",
                style: greenTexStyle.copyWith(
                  fontSize: 40,
                  fontWeight: semiBold,
                  wordSpacing: 0,
                ),
              ),
            ),
            const SizedBox(height: 5),
            AnimatedOpacity(
              opacity: _indexContent == 1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: Text(
                "adalah aplikasi\tpendeteksi tanaman",
                style: blackTexStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                    wordSpacing: 0,
                    letterSpacing: 0),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: _indexContent == 2 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: RichText(
                text: TextSpan(
                    style: blackTexStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 32,
                    ),
                    children: [
                      const TextSpan(text: "Kamu dan"),
                      TextSpan(text: " Tanara\n", style: greenTexStyle),
                      const TextSpan(
                          text:
                              "akan memulai hal\nkecil untuk dampak\nyang besar")
                    ]),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: _indexContent == 3 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: Column(
                children: [
                  Text(
                    "Ayo kita mulai!",
                    style: blackTexStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 96,
            ),
            CustomTextButton(
              label: "Daftar",
              color: kGreenColor,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.registerScreen, (route) => false);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextButton(
              label: "Masuk",
              color: const Color(0xff8CC199),
              onPressed: () {},
            ),
          ],
        )
      ];
      return Expanded(
        child: PageView.builder(
            itemCount: textContents.length,
            onPageChanged: (index) {
              setState(() {
                _indexContent = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                width: double.infinity,
                child: textContents[index],
              );
            }),
      );
    }

    Widget indicator() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 84,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: (_indexContent == 0)
                    ? const Color(0xff9FBF9A)
                    : const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: (_indexContent == 1)
                    ? const Color(0xff9FBF9A)
                    : const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: (_indexContent == 2)
                    ? const Color(0xff9FBF9A)
                    : const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: (_indexContent == 3)
                    ? const Color(0xff9FBF9A)
                    : const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0 && _indexContent < 3) {
                  _updateIndex(1);
                } else if (details.primaryVelocity! > 0 && _indexContent > 0) {
                  _updateIndex(-1);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  logoHeader(),
                  introText(),
                  indicator(),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(60, -200),
              child: Container(
                width: double.infinity,
                height: 700,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome-background.png"),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
