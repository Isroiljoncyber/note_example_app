import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:note_example_app/feature/home/data/model/condition_model.dart';

class ConditionEntity extends Equatable {
  const ConditionEntity({
    this.text = '',
    this.icon = '',
    this.code = 0,
  });

  final String text;
  final String icon;
  final int code;

  @override
  List<Object?> get props => [
        text,
        icon,
        code,
      ];
}

class ConditionConverter extends JsonConverter<ConditionEntity, Map<String, dynamic>> {
  @override
  ConditionEntity fromJson(Map<String, dynamic> json) => ConditionModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(ConditionEntity object) => {};

  const ConditionConverter();
}
