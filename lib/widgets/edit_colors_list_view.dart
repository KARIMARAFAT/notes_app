import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_consts.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';

class EditColorsListView extends StatefulWidget {
  const EditColorsListView({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditColorsListView> createState() => _EditColorsListViewState();
}

class _EditColorsListViewState extends State<EditColorsListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = AppConsts.colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: AppConsts.colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = AppConsts.colors[index].value;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: ColorItem(
                isActive: currentIndex == index,
                color: AppConsts.colors[index],
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
