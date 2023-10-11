import 'package:either_dart/either.dart';
import 'package:note_example_app/feature/home/domain/entities/note_entity.dart';
import 'package:note_example_app/feature/home/domain/entities/weather_entity.dart';

abstract class NoteRepo {
  Future<Either<String, void>> saveNote(NoteEntity noteEntity);

  Future<Either<String, List<NoteEntity>>> getNotes();

  Future<Either<String, void>> deleteNote(NoteEntity noteEntity);

  Future<Either<String, void>> update(NoteEntity noteEntity);

  Future<Either<String, WeatherEntity>> getWeather();
}
