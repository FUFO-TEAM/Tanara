import 'package:flutter/material.dart';
import 'package:tanara/shared/theme.dart';

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
        margin: const EdgeInsets.only(
          top: 30,
        ),
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
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              logoHeader(),
              const SizedBox(
                height: 50,
              ),
              
    
            ],
          ),
        ),
      ),
    );
  }
}