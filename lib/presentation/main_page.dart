import 'package:flutter/material.dart';
import 'package:tanara/presentation/home_page.dart';
import 'package:tanara/presentation/profile_page.dart';
import 'package:tanara/presentation/taman_page.dart';
import 'package:tanara/presentation/toko_page.dart';
import 'package:tanara/shared/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; 
  @override
  Widget build(BuildContext context) {
    Widget navBar() {
      return SizedBox(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 25,
                ),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: kBlackColor.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -4))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onNavItemTapped(0);
                      },
                      child: SizedBox(
                      width: 50,
                      height: 40,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icon-home.png",
                              width: 20,
                              height: 23,
                              color: (_selectedIndex == 0) ? kGreenColor : kBlackColor,
                            ),
                            Text(
                              "Beranda",
                              style: greenTexStyle.copyWith(
                                fontSize: 11,
                                fontWeight: medium,
                                color: (_selectedIndex == 0) ? kGreenColor : kWhiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onNavItemTapped(1);
                      },
                      child: SizedBox(
                      width: 50,
                      height: 40,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icon-shop.png",
                              width: 20,
                              height: 23,
                              color: (_selectedIndex == 1) ? kGreenColor : kBlackColor,
                            ),
                            Text(
                              "Toko",
                              style: whiteTexStyle.copyWith(
                                fontSize: 11,
                                fontWeight: medium,
                                color: (_selectedIndex == 1) ? kGreenColor : kWhiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 50,),
                    GestureDetector(
                      onTap: () {
                        _onNavItemTapped(2);
                      },
                      child: SizedBox(
                      width: 50,
                      height: 40,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icon-tree.png",
                              width: 20,
                              height: 23,
                              color: (_selectedIndex == 2) ? kGreenColor : kBlackColor,
                            ),
                            Text(
                              "Taman",
                              style: whiteTexStyle.copyWith(
                                fontSize: 11,
                                fontWeight: medium,
                                color: (_selectedIndex == 2) ? kGreenColor : kWhiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onNavItemTapped(3);
                      },
                      child: SizedBox(
                      width: 50,
                      height: 40,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icon-user.png",
                              width: 20,
                              height: 23,
                              color: (_selectedIndex == 3) ? kGreenColor : kBlackColor,
                            ),
                            Text(
                              "Saya",
                              style: whiteTexStyle.copyWith(
                                fontSize: 11,
                                fontWeight: medium,
                                color: (_selectedIndex == 3) ? kGreenColor : kWhiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 62,
                  height: 63,
                  decoration: BoxDecoration(
                    color: kGreenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/icon-camera.png",
                      width: 23,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget selectedPage() {
      switch (_selectedIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TokoPage();
        case 2:
          return const TamanPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();  
      }
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: selectedPage(),
            ),
            navBar(),
          ],
        ),
      ),
    );
  }
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}