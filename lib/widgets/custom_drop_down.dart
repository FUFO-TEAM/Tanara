import 'package:flutter/material.dart';
import 'package:tanara/shared/theme.dart';

class CustomDropDown extends StatefulWidget {
  final String label;
  final List<String>items;
  final Function(String) onValueChanged;
  const CustomDropDown({super.key, required this.items, required this.onValueChanged, required this.label});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String selectedValue = "";

  @override
  void initState() {
    super.initState();
    selectedValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 15,
        ),
        underline: Container(),
        style: greyTexStyle.copyWith(
          fontSize: 16,
        ),
        isExpanded: true,
        icon: Container(
          width: 14,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/arrow-drop.png"),
            ),
          ),
        ),
        value: widget.label,
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue.toString();
          });
            widget.onValueChanged(newValue.toString());
        },
        items: widget.items.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
