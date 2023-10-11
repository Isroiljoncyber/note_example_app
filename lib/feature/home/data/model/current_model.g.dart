// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentModel _$CurrentModelFromJson(Map<String, dynamic> json) => CurrentModel(
      condition: json['condition'] == null
          ? const ConditionEntity()
          : const ConditionConverter().fromJson(json['condition'] as Map<String, dynamic>),
      feelslikeC: (json['feelslike_c'] as num?)?.toDouble() ?? 0,
      humidity: json['humidity'] as int? ?? 0,
      tempC: (json['temp_c'] as num?)?.toDouble() ?? 0,
      windDir: json['wind_dir'] as String? ?? '',
      windKph: (json['wind_kph'] as num?)?.toDouble() ?? 0,
      windMph: (json['wind_mph'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$CurrentModelToJson(CurrentModel instance) => <String, dynamic>{
      'temp_c': instance.tempC,
      'condition': const ConditionConverter().toJson(instance.condition),
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_dir': instance.windDir,
      'humidity': instance.humidity,
      'feelslike_c': instance.feelslikeC,
    };
