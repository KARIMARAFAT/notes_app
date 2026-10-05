import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_consts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxlines = 1});
  final String hint;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      cursorColor: AppConsts.kprimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppConsts.kprimaryColor),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(AppConsts.kprimaryColor),
        border: buildBorder(),
      ),
    );
  }
}

// ignore: strict_top_level_inference
OutlineInputBorder buildBorder([Color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color ?? Colors.white),
  );
}
