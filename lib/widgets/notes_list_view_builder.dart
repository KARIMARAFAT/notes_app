import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesListViewBuilder extends StatelessWidget {
  const NotesListViewBuilder({super.key, required this.availablecolors});

  final List<Color> availablecolors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: availablecolors.length,
      itemBuilder: (context, index) {
        return CustomNoteItem(color: availablecolors[index]);
      },
    );
  }
}
