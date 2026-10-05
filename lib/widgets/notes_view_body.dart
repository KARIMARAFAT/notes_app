import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view_builder.dart';

class NotesViewBody extends StatelessWidget {
  NotesViewBody({super.key});
  final List<Color> availablecolors = [
    Color(0xffEDBC75),
    Color(0xffE7E896),
    Color(0xff76D6EE),
    Color(0xffDA9DDD),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: NotesListViewBuilder(availablecolors: availablecolors),
            ),
          ],
        ),
      ),
    );
  }
}
