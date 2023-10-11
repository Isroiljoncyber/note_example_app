import 'package:json_annotation/json_annotation.dart';
import 'package:note_example_app/feature/home/domain/entitys/condition_entity.dart';
import 'package:note_example_app/feature/home/domain/entitys/current_entity.dart';

part 'current_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentModel extends CurrentEntity {
  const CurrentModel({
    super.condition,
    super.feelslikeC,
    super.humidity,
    super.tempC,
    super.windDir,
    super.windKph,
    super.windMph,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) => _$CurrentModelFromJson(json);
}
