import 'package:flutter/material.dart';
import 'package:plana/View/utilities/media_Query.dart';

class TextFields extends StatelessWidget {
  TextFields({
    required this.hintText,
    this.controller,
    this.passwordVisible,
    this.suffixIcon,
    this.inputTextType,
  });

  String? hintText;
  TextEditingController? controller;
  bool? passwordVisible;
  IconButton? suffixIcon;
  TextInputType? inputTextType;

  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();

    return TextField(
      keyboardType: inputTextType,
      controller: controller,
      enableSuggestions: true,
      textAlign: TextAlign.start,
      obscureText: passwordVisible!,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF2F6FF)),
          borderRadius: BorderRadius.circular(height * 0.02),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF2F6FF),
          ),
          borderRadius: BorderRadius.circular(height * 0.02),
        ),
      ),
    );
  }
}
