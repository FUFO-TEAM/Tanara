import 'package:flutter/material.dart';
import 'package:tanara/routes/app_routes.dart';
import 'package:tanara/shared/theme.dart';
import 'package:tanara/widgets/custom_drop_down.dart';
import 'package:tanara/widgets/custom_text_button.dart';

class RekomendasiPage extends StatefulWidget {
  const RekomendasiPage({Key? key}) : super(key: key);

  @override
  _RekomendasiPageState createState() => _RekomendasiPageState();
}

class _RekomendasiPageState extends State<RekomendasiPage> {
  int _indexContent = 0;
  late PageController _pageController;
  List<String> selectedValues = [
    "Jakarta", // default for domisili
    "< 2 jam", // default for waktu
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> domisili = [
      "Jakarta",
      "Bogor",
      "Depok",
      "Tangerang",
      "Tangerang Selatan",
      "Bekasi",
    ];
    List<String> waktu = [
      "< 2 jam",
      "2 - 5 jam",
      "6 - 10 jam",
      "11 - 15 jam",
      "16 - 20 jam",
      "> 20 jam"
    ];
    List<List> content = [
      [
        "Dimana Domisili kamu",
        domisili,
      ],
      [
        "Berapa banyak waktu\nluangmu dalam sehari?",
        waktu,
      ]
    ];

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
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: content.length,
                  onPageChanged: (index) {
                    setState(() {
                      _indexContent = index;
                    });
                    // print(selectedValues[index--]);
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Center(
                          child: Text(
                            content[index][0],
                            style: blackTexStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomDropDown(
                          label: selectedValues[index],
                          items: content[index][1],
                          onValueChanged: (newValue) {
                            setState(() {
                              selectedValues[index] = newValue;
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: CustomTextButton(
                  label: "Lanjut",
                  color: kGreenColor,
                  onPressed: () {
                    if (_indexContent < content.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                    Future.delayed(const Duration(milliseconds: 600), () {
                      if (_indexContent == content.length - 1) {
                        Navigator.pushNamedAndRemoveUntil(context,
                            AppRoutes.rekomendasiPlantScreen, (route) => false);
                      }
                    });
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 90,
                  ),
                  child: Center(
                    child: Text(
                      "Kembali",
                      style: greenTexStyle.copyWith(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
