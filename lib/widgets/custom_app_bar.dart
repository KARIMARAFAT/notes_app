import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 24)),
        CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xff3C3C3C),
          child: IconButton(onPressed: onPressed, icon: Icon(icon, size: 30)),
        ),
      ],
    );
  }
}
