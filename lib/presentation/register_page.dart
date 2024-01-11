import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanara/provider/auth_provider.dart';
import 'package:tanara/routes/app_routes.dart';
import 'package:tanara/shared/theme.dart';
import 'package:tanara/widgets/custom_text_button.dart';
import 'package:tanara/widgets/custom_text_field.dart';

// import 'package:google_sign_in/google_sign_in.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController namaController = TextEditingController(text: "");
  final TextEditingController noHpController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(text: "");
  
  RegisterScreen({super.key});

  @override
 @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

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
        )),
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
                "Daftar",
                style: blackTexStyle.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                label: "Nama",
                isPass: false,
                controller: namaController,
              ),
              CustomTextField(
                label: "No. Handphone",
                isPass: false,
                controller: noHpController,
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
                label: "Daftar",
                color: const Color(0xff8CC199),
                onPressed: () async {
                  authProvider.submit();
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.rekomendasiScreen, (route) => false);
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
                    "Sudah punya akun?",
                    style: greyTexStyle,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.loginScreen);
                    },
                    child: Text(
                      "Masuk",
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
