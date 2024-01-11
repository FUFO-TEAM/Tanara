import 'package:flutter/material.dart';
import 'package:tanara/shared/theme.dart';

class DetailTanaman extends StatelessWidget {
  DetailTanaman({
    super.key,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/background-detail.png"),
                fit: BoxFit.cover,
              )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 45.6,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.only(
                        top: 15,
                        left: 50,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/arrow-drop.png"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
