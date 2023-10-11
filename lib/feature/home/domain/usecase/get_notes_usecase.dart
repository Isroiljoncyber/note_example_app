import 'package:either_dart/either.dart';
import 'package:note_example_app/core/singleton/service.dart';
import 'package:note_example_app/feature/home/data/repo/note_repo_impl.dart';
import 'package:note_example_app/feature/home/domain/entitys/note_entity.dart';
import 'package:note_example_app/feature/home/domain/repo/note_repo.dart';

class GetNotesUseCase {
  final NoteRepo _repo = serviceLocator<NoteRepoImpl>();

  Future<Either<String, List<NoteEntity>>> call() async {
    return await _repo.getNotes();
  }
}
