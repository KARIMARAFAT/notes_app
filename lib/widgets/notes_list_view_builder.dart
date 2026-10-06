import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/cubits/cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesListViewBuilder extends StatelessWidget {
  const NotesListViewBuilder({super.key});

  // final List<Color> availablecolors;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return CustomNoteItem(note: notes[index]);
          },
        );
      },
    );
  }
}
