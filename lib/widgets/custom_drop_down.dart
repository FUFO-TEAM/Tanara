import 'package:flutter/material.dart';
import 'package:tanara/shared/theme.dart';

class CustomDropDown extends StatefulWidget {
  final String label;
  final List<String> items; // Includes both IDs and options
  final Function(String) onValueChanged;

  const CustomDropDown({
    Key? key,
    required this.items,
    required this.onValueChanged,
    required this.label,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    // Set the initial value to the label, if it's in the items list
    selectedValue = widget.label;
    // If the initial label is not in the items list, set it to the first item
    if (!widget.items.contains(widget.label) && widget.items.isNotEmpty) {
      selectedValue = widget.items.first;
      // Trigger onValueChanged with the initial value after the build is complete
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        widget.onValueChanged(selectedValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final startOptionsIndex = widget.items.length ~/ 2;

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
        value: selectedValue.isNotEmpty ? selectedValue : null,
        onChanged: (newValue) {
          // Update the selected value immediately
          setState(() {
            selectedValue = newValue.toString();
          });

          // Provide a slight delay to let the setState complete before calling onValueChanged
          Future.delayed(Duration(milliseconds: 50), () {
            widget.onValueChanged(newValue.toString());
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
