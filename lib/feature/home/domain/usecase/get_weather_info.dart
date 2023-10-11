import 'package:either_dart/either.dart';
import 'package:note_example_app/core/singleton/service.dart';
import 'package:note_example_app/feature/home/data/repo/note_repo_impl.dart';
import 'package:note_example_app/feature/home/domain/entities/note_entity.dart';
import 'package:note_example_app/feature/home/domain/entities/weather_entity.dart';
import 'package:note_example_app/feature/home/domain/repo/note_repo.dart';

class GetWeatherUseCase {
  final NoteRepo _repo = serviceLocator<NoteRepoImpl>();

  Future<Either<String, WeatherEntity>> call() async {
    return await _repo.getWeather();
  }
}
