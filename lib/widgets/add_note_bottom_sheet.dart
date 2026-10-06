import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_state.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteCubitSuccess) {
            Navigator.pop(context);
          } else if (state is AddNoteCubitFailure) {
            print('failed ${state.errorMessage}');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteCubitLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(child: AddFormNote()),
            ),
          );
        },
      ),
    );
  }
}
