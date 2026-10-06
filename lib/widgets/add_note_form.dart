import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddFormNote extends StatefulWidget {
  const AddFormNote({super.key});

  @override
  State<AddFormNote> createState() => _AddFormNoteState();
}

class _AddFormNoteState extends State<AddFormNote> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextField(
            onsaved: (value) {
              title = value;
            },
            hint: 'title',
          ),
          SizedBox(height: 16),
          CustomTextField(
            hint: 'content',
            onsaved: (value) {
              subTitle = value;
            },
            maxlines: 5,
          ),
          SizedBox(height: 32),
          CustomButton(
            ontap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var notemodel = NoteModel(
                  title: title!,
                  subtitle: subTitle!,
                  date: DateTime.now().toString(),
                  color: Colors.amber.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addnote(notemodel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
