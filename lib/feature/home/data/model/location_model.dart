import 'package:note_example_app/feature/home/domain/entities/location_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends LocationEntity {
  const LocationModel({
    super.country,
    super.localtime,
    super.name,
    super.region,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
}
