import 'package:json_annotation/json_annotation.dart';
import 'package:note_example_app/feature/home/domain/entities/condition_entity.dart';

part 'condition_model.g.dart';

@JsonSerializable()
class ConditionModel extends ConditionEntity {
  const ConditionModel({
    super.code,
    super.icon,
    super.text,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) => _$ConditionModelFromJson(json);
}
