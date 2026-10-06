import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants/app_consts.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_state.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());
  void addnote(NoteModel note) {
    emit(AddNoteCubitLoading());
    try {
      var notesBox = Hive.box<NoteModel>(AppConsts.knotesbox);
      notesBox.add(note);
      emit(AddNoteCubitSuccess());
    } catch (e) {
      emit(AddNoteCubitFailure(e.toString()));
    }
  }
}
