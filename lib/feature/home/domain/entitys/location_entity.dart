import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:note_example_app/feature/home/data/model/location_model.dart';

class LocationEntity extends Equatable {
  const LocationEntity({
    this.name = '',
    this.region = '',
    this.country = '',
    this.localtime = '',
  });

  final String name;
  final String region;
  final String country;
  final String localtime;

  @override
  List<Object?> get props =>
      [
        name,
        region,
        country,
        localtime,
      ];
}


class LocationConverter extends JsonConverter<LocationEntity, Map<String, dynamic>> {
  @override
  LocationEntity fromJson(Map<String, dynamic> json) => LocationModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(LocationEntity object) => {};

  const LocationConverter();

}