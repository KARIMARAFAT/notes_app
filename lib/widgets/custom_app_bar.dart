import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('Notes', style: TextStyle(fontSize: 24)),
        Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xff3C3C3C),
          child: Icon(Icons.search, size: 30),
        ),
      ],
    );
  }
}
