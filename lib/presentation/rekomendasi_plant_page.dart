import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:tanara/presentation/detail_tanaman.dart';
import 'package:tanara/provider/tanaman_provider.dart';
import 'package:tanara/shared/theme.dart';
import 'package:tanara/widgets/custom_text_button.dart';

// ignore: must_be_immutable
class RekomendasiPlantPage extends StatefulWidget {
  List<String> selectedID;
  RekomendasiPlantPage({super.key, required this.selectedID});

  @override
  State<RekomendasiPlantPage> createState() => _RekomendasiPlantPageState();
}

class _RekomendasiPlantPageState extends State<RekomendasiPlantPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TanamanProvider>(context, listen: false).fetchRekomendasi(widget.selectedID);
    widget.selectedID.map((e) => print(e));
  }
  
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TanamanProvider tanamanProvider = Provider.of<TanamanProvider>(context);

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Center(
                child: Text(
                  "Berikut adalah tanaman yang\n cocok denganmu!",
                  style: blackTexStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 44,
            ),
            Consumer<TanamanProvider>(builder: (context, tanamanProvider, _) {
              return FlutterCarousel(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.width / 1.5,
                    showIndicator: false,
                    viewportFraction: 0.6,
                    enlargeCenterPage: true,
                    initialPage: tanamanProvider.tanamanList.length ~/ 2,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
                items: tanamanProvider.tanamanList.map((tanaman) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(tanaman.gambar),
                            fit: BoxFit.cover,
                          )
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }),
            const SizedBox(
              height: 65,
            ),
            Consumer<TanamanProvider>(
              builder: (context, tanamanProvider, _) {
                // ignore: unnecessary_null_comparison
                if (tanamanProvider.tanamanList != null &&
                    tanamanProvider.tanamanList.isNotEmpty &&
                    _currentIndex >= 0 &&
                    _currentIndex < tanamanProvider.tanamanList.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Center(
                      child: Text(
                        tanamanProvider.tanamanList[_currentIndex].nama,
                        style: blackTexStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  );
                } else {
                  // Handle the case when tanamanList is null, empty, or index is out of range
                  return Center(
                    child: Text(
                      "No data available",
                      style: blackTexStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                  );
                }
              },
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 159, left: 26, right: 26),
              child: CustomTextButton(
                label: "Pilih",
                color: const Color(0xff8CC199),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailTanaman(tanamanModel: tanamanProvider.tanamanList[_currentIndex])));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
