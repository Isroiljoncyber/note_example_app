import 'package:get_it/get_it.dart';
import 'package:note_example_app/feature/home/data/datasource/note_datasource.dart';
import 'package:note_example_app/feature/home/data/repo/note_repo_impl.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton(() => NoteDataSourceImpl());
  serviceLocator.registerLazySingleton(() => NoteRepoImpl());
}
