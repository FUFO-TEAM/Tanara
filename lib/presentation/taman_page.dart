import 'package:flutter/material.dart';
import 'package:tanara/shared/theme.dart';

class TamanPage extends StatefulWidget {
  const TamanPage({Key? key}) : super(key: key);

  @override
  State<TamanPage> createState() => _TamanPageState();
}

class _TamanPageState extends State<TamanPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, -50),
            child: Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 40),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/header-taman.png"),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Text(
                  "Taman Saya ",
                  style: blackTexStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCard("My Garden #1", "5 Tanaman", "assets/card-taman.png"),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 220,
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffF8F8F8),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icon-plus.png",
                    width: 30,
                    height: 30, // Set the height to match the width for a square image
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: blackTexStyle.copyWith(fontSize: 12),
          ),
          Text(
            subtitle,
            style: blackTexStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
