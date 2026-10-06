import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
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
  final List<int> availablecolors = [
    0xffEDBC75,
    0xffE7E896,
    0xff76D6EE,
    0xffDA9DDD,
  ];
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
          SizedBox(height: 24),
          CustomTextField(
            hint: 'content',
            onsaved: (value) {
              subTitle = value;
            },
            maxlines: 5,
          ),

          SizedBox(height: 16),
          ColorsListView(),
          SizedBox(height: 16),

          BlocBuilder<AddNoteCubit, AddNoteCubitState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteCubitLoading ? true : false,
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    var currentDate = DateTime.now();
                    var formatedDate = DateFormat.yMd().format(currentDate);
                    formKey.currentState!.save();
                    var notemodel = NoteModel(
                      title: title!,
                      subtitle: subTitle!,
                      date: formatedDate,
                      color: Colors.amber.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addnote(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
