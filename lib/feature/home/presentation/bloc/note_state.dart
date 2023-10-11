part of 'note_cubit.dart';

class NoteState extends Equatable {
  final FormzSubmissionStatus status;
  final FormzSubmissionStatus weatherStatus;
  final List<NoteEntity> notes;
  final WeatherEntity weatherEntity;

  const NoteState({
    this.status = FormzSubmissionStatus.initial,
    this.weatherStatus = FormzSubmissionStatus.initial,
    this.notes = const [],
    this.weatherEntity = const WeatherEntity(),
  });

  NoteState copyWith({
    FormzSubmissionStatus? status,
    FormzSubmissionStatus? weatherStatus,
    List<NoteEntity>? notes,
    WeatherEntity? weatherEntity,
  }) =>
      NoteState(
        status: status ?? this.status,
        notes: notes ?? this.notes,
        weatherStatus: weatherStatus ?? this.weatherStatus,
        weatherEntity: weatherEntity ?? this.weatherEntity,
      );

  @override
  List<Object> get props => [
        status,
        notes,
        weatherEntity,
        weatherStatus,
      ];
}
