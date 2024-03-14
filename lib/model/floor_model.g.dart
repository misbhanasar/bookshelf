// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class floormodelAdapter extends TypeAdapter<floormodel> {
  @override
  final int typeId = 1;

  @override
  floormodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return floormodel(
      id: fields[0] as String,
      floornumbersetting: fields[1] as String,
      shelfnumbersetting: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, floormodel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.floornumbersetting)
      ..writeByte(2)
      ..write(obj.shelfnumbersetting);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is floormodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
