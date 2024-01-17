import 'package:flutter/material.dart';
import 'package:tanara/shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Halo, Lotso!",
                style: blackTexStyle.copyWith(
                  fontSize: 26,
                  fontWeight: semiBold,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon-notif.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/bg-card-home.png"),
                fit: BoxFit.cover,
              )),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Lokasi Kamu",
                    style: whiteTexStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Jakarta, Indonesia",
                    style: whiteTexStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
              Container(
                width: 127,
                height: 92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.73),
                  color: kBlackColor.withOpacity(0.2),
                ),
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "AQI",
                      style: whiteTexStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      "91",
                      style: whiteTexStyle.copyWith(
                        fontSize: 40,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 249,
                height: 130,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage("assets/bg-card-home-tanaman.png"),
                      fit: BoxFit.cover,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "My Garden #1",
                      style: blackTexStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "5 Tanaman",
                      style: blackTexStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  width: 109,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF8F8F8),
                  ),
                  child: Center(
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage("assets/icon-plus.png"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ))
            ],
          ),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Promo",
                style: blackTexStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 190,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/bg-card-home-promo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "5 hari lalu",
                      style: blackTexStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Promo Terbaru di Tanara",
                      style: blackTexStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
