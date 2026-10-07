import 'package:flutter/material.dart';

void showsnackbar(
  BuildContext context, {
  required Color color,
  required String text,
}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(backgroundColor: color, content: Text(text)));
}
