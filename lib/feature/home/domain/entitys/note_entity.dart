import 'package:hive/hive.dart';

part 'note_entity.g.dart';

@HiveType(typeId: 1)
class NoteEntity extends HiveObject {

  @HiveField(0)
  String? title;
  @HiveField(1)
  String? createAt;
  @HiveField(2)
  String? content;
  @HiveField(3)
  String? updateAt;
  @HiveField(4)
  bool? isPinned;

  NoteEntity({
    this.title,
    this.createAt,
    this.content,
    this.updateAt,
    this.isPinned,
  });

}
