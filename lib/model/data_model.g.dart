// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class bookmodelAdapter extends TypeAdapter<bookmodel> {
  @override
  final int typeId = 1;

  @override
  bookmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return bookmodel(
      bokname: fields[1] as String,
      authorname: fields[2] as String,
      floornumber: fields[3] as String,
      shelfnumber: fields[4] as String,
      bookdetails: fields[5] as String,
      imagepath: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, bookmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.bokname)
      ..writeByte(2)
      ..write(obj.authorname)
      ..writeByte(3)
      ..write(obj.floornumber)
      ..writeByte(4)
      ..write(obj.shelfnumber)
      ..writeByte(5)
      ..write(obj.bookdetails)
      ..writeByte(6)
      ..write(obj.imagepath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is bookmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
