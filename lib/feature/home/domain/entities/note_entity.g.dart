// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteEntityAdapter extends TypeAdapter<NoteEntity> {
  @override
  final int typeId = 1;

  @override
  NoteEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteEntity(
      title: fields[0] as String?,
      createAt: fields[1] as String?,
      content: fields[2] as String?,
      updateAt: fields[3] as String?,
      isPinned: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, NoteEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.createAt)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.updateAt)
      ..writeByte(4)
      ..write(obj.isPinned);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
