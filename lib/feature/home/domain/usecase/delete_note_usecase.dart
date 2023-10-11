import 'package:either_dart/either.dart';
import 'package:note_example_app/core/singleton/service.dart';
import 'package:note_example_app/feature/home/data/repo/note_repo_impl.dart';
import 'package:note_example_app/feature/home/domain/entities/note_entity.dart';
import 'package:note_example_app/feature/home/domain/repo/note_repo.dart';

class DeleteNoteUseCase {
  final NoteRepo _repo = serviceLocator<NoteRepoImpl>();

  Future<Either<String, void>> call(NoteEntity noteEntity) async {
    return await _repo.deleteNote(noteEntity);
  }
}
