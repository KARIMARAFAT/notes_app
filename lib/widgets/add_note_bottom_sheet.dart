import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_consts.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            CustomTextField(hint: 'title'),
            SizedBox(height: 16),
            CustomTextField(hint: 'content', maxlines: 5),
            SizedBox(height: 32),
            CustomButton(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
