import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:tanara/shared/theme.dart';
import 'package:tanara/widgets/custom_text_button.dart';

class RekomendasiPlantPage extends StatefulWidget {
  const RekomendasiPlantPage({super.key});

  @override
  State<RekomendasiPlantPage> createState() => _RekomendasiPlantPageState();
}

class _RekomendasiPlantPageState extends State<RekomendasiPlantPage> {
  @override
  Widget build(BuildContext context) {
    Widget logoHeader() {
      return Container(
        width: 18,
        height: 35,
        margin: const EdgeInsets.only(top: 30, left: 26),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/tanara-icon-mini.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logoHeader(),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                "Berikut adalah tanaman yang\n cocok denganmu!",
                style: blackTexStyle.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 44,
            ),
            FlutterCarousel(
              options: CarouselOptions(
                height: 250.0,
                showIndicator: false,
                viewportFraction: 0.6,
                enlargeCenterPage: true,
                initialPage: 3,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 65,
            ),
            Center(
              child: Text(
                "Lidah Mertua",
                style: blackTexStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 159, left: 26, right: 26),
              child: CustomTextButton(
                label: "Pilih",
                color: const Color(0xff8CC199),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
