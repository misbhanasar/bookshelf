// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FloorModelAdapter extends TypeAdapter<FloorModel> {
  @override
  final int typeId = 0;

  @override
  FloorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FloorModel(
      floornumbersetting: fields[1] as String,
      shelfnumbersetting: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FloorModel obj) {
    writer
      ..writeByte(2)
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
      other is FloorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
