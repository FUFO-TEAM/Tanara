import 'package:flutter/material.dart';
import 'package:tanara/shared/theme.dart';

class DetailTanaman extends StatelessWidget {
  const DetailTanaman({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(0, -50),
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/background-detail.png"),
                  fit: BoxFit.cover,
                )),
              ),
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
                const SizedBox(height: 25,),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lidah Mertua",
                              style: blackTexStyle.copyWith(
                                  fontSize: 24, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Scientific Name",
                              style: blackTexStyle.copyWith(
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 214,
                        height: 242,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffF7F7F7),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 45,),
                Container(
                  margin: const EdgeInsets.only(left: 26),
                  child: Row(
                    children: [
                      Text("Tentang"),
                      Text("Perlengkapan"),
                      Text("Perawatan"),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
