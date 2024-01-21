import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.currentFocus,
    this.nextFocus,
    this.hint,
    required this.maxLines,
    this.enable,
    required this.maxLength,
    this.keyboardType,
  });

  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final String? hint;
  final int maxLines;
  final int maxLength;
  final bool? enable;
  final TextInputType? keyboardType;

  // final String? label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enable,
      focusNode: currentFocus,
      maxLines: maxLines,
      maxLength: 30,
      keyboardType: keyboardType,
      textInputAction:
          nextFocus == null ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        counterText: '',

        // hintText: '$label',
        filled: true,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: Text(
          '$hint',
          style: const TextStyle(color: Color(0xffa1a1a1)),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
