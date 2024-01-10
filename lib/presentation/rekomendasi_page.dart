import 'package:flutter/material.dart';
import 'package:tanara/presentation/rekomendasi_plant_page.dart';
import 'package:tanara/provider/pertanyaan_provider.dart';
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
  late List<List<String>> content;
  late List<String> selectedValues;

  // Initialize PertanyaanProvider
  late PertanyaanProvider _pertanyaanProvider;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pertanyaanProvider = PertanyaanProvider();
    selectedValues = [];
    content = [];

    // Fetch data and initialize state
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _pertanyaanProvider.fetchPertanyaan();
    content = _pertanyaanProvider.pertanyaanList
        .map((pertanyaan) => [
              pertanyaan.pertanyaan!,
              ...pertanyaan.opsi!.map((opsi) => opsi.jawaban!).toList()
            ])
        .toList();

    setState(() {
      selectedValues = List.filled(content.length, '');
    });
  }

  void navigateToNextPage() {
    if (_indexContent < content.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // Use Navigator.push instead of pushReplacement
      content.clear();
      _pageController.dispose();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RekomendasiPlantPage()),
      );
    }
  }

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
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: content.length,
                  
                  onPageChanged: (index) {
                    setState(() {
                      _indexContent = index;
                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(
                          content[index][0],
                          textAlign: TextAlign.center,
                          style: blackTexStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomDropDown(
                          label: selectedValues[index],
                          items: content[index].sublist(1),
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

              // Your UI widgets...

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: CustomTextButton(
                  label: "Lanjut",
                  color: const Color(0xff8CC199),
                  onPressed: () {
                    navigateToNextPage();
                  },
                ),
              ),

              Opacity(
                opacity: (_indexContent == 0) ? 0 : 1,
                child: GestureDetector(
                  onTap: () {
                    (_indexContent == 0) ? "": _pageController.previousPage(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
