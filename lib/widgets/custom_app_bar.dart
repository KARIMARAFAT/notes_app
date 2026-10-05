import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 24)),
        CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xff3C3C3C),
          child: IconButton(onPressed: () {}, icon: Icon(icon, size: 30)),
        ),
      ],
    );
  }
}
