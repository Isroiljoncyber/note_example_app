import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:note_example_app/feature/home/data/model/current_model.dart';
import 'package:note_example_app/feature/home/domain/entities/condition_entity.dart';

class CurrentEntity extends Equatable {
  const CurrentEntity({
    this.tempC = 0,
    this.condition = const ConditionEntity(),
    this.windMph = 0,
    this.windKph = 0,
    this.windDir = '',
    this.humidity = 0,
    this.feelslikeC = 0,
  });

  final double tempC;
  @ConditionConverter()
  final ConditionEntity condition;
  final double windMph;
  final double windKph;
  final String windDir;
  final int humidity;
  final double feelslikeC;

  @override
  List<Object?> get props => [
        tempC,
        condition,
        windMph,
        windKph,
        windDir,
        humidity,
        feelslikeC,
      ];
}

class CurrentConverter extends JsonConverter<CurrentEntity, Map<String, dynamic>> {
  @override
  CurrentEntity fromJson(Map<String, dynamic> json) => CurrentModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(CurrentEntity object) => {};

  const CurrentConverter();
}
