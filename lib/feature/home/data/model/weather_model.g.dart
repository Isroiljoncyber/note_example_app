// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      current: json['current'] == null
          ? const CurrentEntity()
          : const CurrentConverter().fromJson(json['current'] as Map<String, dynamic>),
      location: json['location'] == null
          ? const LocationEntity()
          : const LocationConverter().fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) => <String, dynamic>{
      'location': const LocationConverter().toJson(instance.location),
      'current': const CurrentConverter().toJson(instance.current),
    };
