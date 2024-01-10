import 'package:flutter/material.dart';
import 'package:tanara/routes/app_routes.dart';
import 'package:tanara/shared/theme.dart';
import 'package:tanara/widgets/custom_text_button.dart';
import 'package:tanara/widgets/custom_text_field.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");

  LoginPage({super.key});

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      print("Google Sign In successful: ${userCredential.user?.displayName}");

      // Navigasi atau lakukan tindakan lain setelah login berhasil
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.rekomendasiScreen, (route) => false);
    } catch (e) {
      print("Google Sign In failed: $e");
      // Tambahkan logika atau tampilkan pesan kesalahan ke pengguna
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
            image: AssetImage("assets/tanara-icon-mini.png"),
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                logoHeader(),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Masuk",
                  style: blackTexStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  label: "Email",
                  isPass: false,
                  controller: emailController,
                ),
                CustomTextField(
                  label: "Password",
                  isPass: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextButton(
                  label: "Masuk",
                  color: const Color(0xff8CC199),
                  onPressed: () async {
                    try {
                      UserCredential userCredential =
                          await _auth.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                    // Login berhasil, tambahkan logika navigasi atau tindakan lain di sini
                    print("Login successful: ${userCredential.user?.email}");
                    // Contoh navigasi ke halaman beranda setelah login
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.rekomendasiScreen, (route) => false);
                  } catch (e) {
                    // Login gagal, tangani kesalahan di sini
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        content: const Text("Login failed"),
                        backgroundColor: Color.fromARGB(255, 248, 103, 103),
                      ),
                    );
                    // Tambahkan logika atau tampilkan pesan kesalahan ke pengguna
                  }
                },
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: kGreyColor,
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      "atau",
                      style: greyTexStyle.copyWith(),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Expanded(
                      child: Divider(
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "Daftar dengan Google",
                  style: blackTexStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya akun?",
                    style: greyTexStyle,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.registerScreen);
                    },
                    child: Text(
                      "Daftar",
                      style: greenTexStyle,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
