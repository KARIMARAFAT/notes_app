import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/app_consts.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(AppConsts.knotesbox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),
      home: NotesView(),
    );
  }
}
