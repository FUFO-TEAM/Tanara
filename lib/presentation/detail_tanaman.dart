import 'package:flutter/material.dart';
import 'package:tanara/models/tanaman_model.dart';
import 'package:tanara/shared/theme.dart';
import 'package:tanara/widgets/custom_text_button.dart';

class DetailTanaman extends StatefulWidget {
  TanamanModel tanamanModel;
  DetailTanaman({
    required this.tanamanModel,
    super.key,
  });

  @override
  State<DetailTanaman> createState() => _DetailTanamanState();
}

class _DetailTanamanState extends State<DetailTanaman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(0, -50),
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/background-detail.png"),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 45.6,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.only(
                        top: 15,
                        left: 50,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/arrow-drop.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tanamanModel.nama,
                              style: blackTexStyle.copyWith(
                                  fontSize: 24, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.tanamanModel.jenis,
                              style: blackTexStyle.copyWith(
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 1.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffF7F7F7),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.tanamanModel.gambar,
                            ),
                            fit: BoxFit.cover
                            )
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 26),
                    ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
                  child: Text(
                    widget.tanamanModel.deskripsi,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 30,
                  ),
                  child: CustomTextButton(
                    label: "Pilih",
                    color: const Color(0xff8CC199),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
