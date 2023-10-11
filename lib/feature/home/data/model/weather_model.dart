import 'package:json_annotation/json_annotation.dart';
import 'package:note_example_app/feature/home/domain/entitys/current_entity.dart';
import 'package:note_example_app/feature/home/domain/entitys/location_entity.dart';
import 'package:note_example_app/feature/home/domain/entitys/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends WeatherEntity {
  const WeatherModel({
    super.current,
    super.location,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}
