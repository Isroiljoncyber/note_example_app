import 'package:equatable/equatable.dart';
import 'package:note_example_app/feature/home/domain/entities/current_entity.dart';
import 'package:note_example_app/feature/home/domain/entities/location_entity.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    this.location = const LocationEntity(),
    this.current = const CurrentEntity(),
  });

  @LocationConverter()
  final LocationEntity location;
  @CurrentConverter()
  final CurrentEntity current;

  @override
  List<Object?> get props => [
        location,
        current,
      ];
}
