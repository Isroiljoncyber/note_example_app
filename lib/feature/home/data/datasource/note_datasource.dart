import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:note_example_app/core/app_constants.dart';
import 'package:note_example_app/core/hive/hive_utils.dart';
import 'package:note_example_app/feature/home/data/model/weather_model.dart';
import 'package:note_example_app/feature/home/domain/entities/note_entity.dart';

abstract class NoteDataSource {
  Future<void> saveNote(NoteEntity noteEntity);

  Future<void> update(NoteEntity noteEntity);

  Future<void> deleteNote(NoteEntity noteEntity);

  Future<List<NoteEntity>> getNotes();

  Future<WeatherModel> getWeather();
}

class NoteDataSourceImpl with HiveUtil implements NoteDataSource {
  final dio = Dio();

  @override
  Future<void> saveNote(NoteEntity noteEntity) async {
    try {
      addBox<NoteEntity>(AppConstants.noteBox, noteEntity);
    } catch (e) {
      throw HiveError(e.toString());
    }
  }

  @override
  Future<List<NoteEntity>> getNotes() async {
    try {
      final result = await getBoxAllValue<NoteEntity>(AppConstants.noteBox);
      if (result != null) {
        return result;
      } else {
        return [];
      }
    } catch (e) {
      throw HiveError(e.toString());
    }
  }

  @override
  Future<void> deleteNote(NoteEntity noteEntity) async {
    try {
      deleteBoxKey<NoteEntity>(AppConstants.noteBox, noteEntity.key);
    } catch (e) {
      throw HiveError(e.toString());
    }
  }

  @override
  Future<void> update(NoteEntity noteEntity) async {
    try {
      saveBox<NoteEntity>(AppConstants.noteBox, noteEntity, key: noteEntity.key);
    } catch (e) {
      throw HiveError(e.toString());
    }
  }

  @override
  Future<WeatherModel> getWeather() async {
    try {
      final response = await dio.get(
        'http://api.weatherapi.com/v1/current.json?q=41.2994958,69.2400734',
        options: Options(
          headers: {'key': 'ad63b84658244559b9d143419231110'},
        ),
      );
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage ?? "");
      }
    } on DioException catch (e) {
      throw DioException(message:e.message, requestOptions: e.requestOptions);
    } catch (e) {
      throw Exception(e);
    }
  }
}
