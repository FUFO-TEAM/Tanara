import 'package:flutter/material.dart';
import 'package:tanara/shared/theme.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String label;
  bool isPass;
  final TextEditingController controller;

  CustomTextField({
    Key? key,
    required this.label,
    this.isPass = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(8), 
      ),
      child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                obscureText: obscureText,
                decoration: InputDecoration.collapsed(
                  hintText: widget.label,
                  fillColor: const Color(0xffC1C1C1),
                  hintStyle: greyTexStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            (true) ? GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Container(
                width: 20,
                height: 14,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon-eye.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ) : const SizedBox()
          ],
        ),
    );
  }
}
