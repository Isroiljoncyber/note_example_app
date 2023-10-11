import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:hive/hive.dart';
import 'package:note_example_app/core/singleton/service.dart';
import 'package:note_example_app/feature/home/data/datasource/note_datasource.dart';
import 'package:note_example_app/feature/home/domain/entitys/note_entity.dart';
import 'package:note_example_app/feature/home/domain/entitys/weather_entity.dart';
import 'package:note_example_app/feature/home/domain/repo/note_repo.dart';

class NoteRepoImpl implements NoteRepo {
  final NoteDataSource _dataSource = serviceLocator<NoteDataSourceImpl>();

  @override
  Future<Either<String, void>> saveNote(NoteEntity noteEntity) async {
    try {
      await _dataSource.saveNote(noteEntity);
      return const Right("");
    } on HiveError catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, List<NoteEntity>>> getNotes() async {
    try {
      final result = await _dataSource.getNotes();
      return Right(result);
    } on HiveError catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, void>> deleteNote(NoteEntity noteEntity) async {
    try {
      await _dataSource.deleteNote(noteEntity);
      return const Right("");
    } on HiveError catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, void>> update(NoteEntity noteEntity) async {
    try {
      await _dataSource.update(noteEntity);
      return const Right("");
    } on HiveError catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, WeatherEntity>> getWeather() async {
    try {
      final result = await _dataSource.getWeather();
      return Right(result);
    } on DioException catch (e) {
      return Left(e.message ?? "");
    }
  }
}
