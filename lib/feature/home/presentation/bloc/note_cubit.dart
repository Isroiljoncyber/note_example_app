import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:note_example_app/feature/home/domain/entities/note_entity.dart';
import 'package:note_example_app/feature/home/domain/entities/weather_entity.dart';
import 'package:note_example_app/feature/home/domain/usecase/delete_note_usecase.dart';
import 'package:note_example_app/feature/home/domain/usecase/get_notes_usecase.dart';
import 'package:note_example_app/feature/home/domain/usecase/get_weather_info.dart';
import 'package:note_example_app/feature/home/domain/usecase/save_note_usecase.dart';
import 'package:note_example_app/feature/home/domain/usecase/update_note_usecase.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteState());

  final SaveNoteUseCase _saveNoteUseCase = SaveNoteUseCase();
  final GetNotesUseCase _getNotesUseCase = GetNotesUseCase();
  final DeleteNoteUseCase _deleteNoteUseCase = DeleteNoteUseCase();
  final UpdateNoteUseCase _updateNoteUseCase = UpdateNoteUseCase();
  final GetWeatherUseCase _getWeatherUseCase = GetWeatherUseCase();

  Future<void> saveNote(
    NoteEntity noteEntity,
    Function() onSuccess,
    Function(String e) onError,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _saveNoteUseCase.call(noteEntity);
    if (result.isRight) {
      final newList = [...state.notes];
      newList.add(noteEntity);
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        notes: newList,
      ));
      onSuccess();
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      onError(result.left);
    }
  }

  Future<void> updateNote(
    NoteEntity noteEntity,
    Function() onSuccess,
    Function(String e) onError,
    int index,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    noteEntity.createAt = DateTime.now().toString();
    final result = await _updateNoteUseCase.call(noteEntity);
    if (result.isRight) {
      final newList = [...state.notes];
      newList[index] = noteEntity;
      newList.sort(
        (a, b) => DateTime.parse(b.createAt!).compareTo(DateTime.parse(a.createAt!)),
      );
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        notes: newList,
      ));
      onSuccess();
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      onError(result.left);
    }
  }

  Future<void> getNotes() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _getNotesUseCase.call();
    if (result.isRight) {
      result.right.sort(
        (a, b) => DateTime.parse(b.createAt!).compareTo(DateTime.parse(a.createAt!)),
      );
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        notes: result.right,
      ));
      // onSuccess();
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      // onError(result.left);
    }
  }

  Future<void> getWeather(Function(String e) onError) async {
    emit(state.copyWith(weatherStatus: FormzSubmissionStatus.inProgress));
    final result = await _getWeatherUseCase.call();
    if (result.isRight) {
      emit(state.copyWith(
        weatherStatus: FormzSubmissionStatus.success,
        weatherEntity: result.right,
      ));
      // onSuccess();
    } else {
      emit(state.copyWith(weatherStatus: FormzSubmissionStatus.failure));
      onError(result.left);
    }
  }

  Future<void> deleteNote(
    NoteEntity noteEntity,
    Function() onSuccess,
    Function(String e) onError,
  ) async {
    // emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _deleteNoteUseCase.call(noteEntity);
    if (result.isRight) {
      final newList = List<NoteEntity>.from(state.notes);
      newList.remove(noteEntity);
      emit(state.copyWith(
        // status: FormzSubmissionStatus.success,
        notes: newList,
      ));
      onSuccess();
    } else {
      // emit(state.copyWith(status: FormzSubmissionStatus.failure));
      onError(result.left);
    }
  }
}
