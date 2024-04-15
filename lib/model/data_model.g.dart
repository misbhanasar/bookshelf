// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmodelAdapter extends TypeAdapter<Bookmodel> {
  @override
  final int typeId = 1;

  @override
  Bookmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bookmodel(
      bokname: fields[1] as String,
      authorname: fields[2] as String,
      floornumber: fields[3] as String,
      shelfnumber: fields[4] as String,
      bookdetails: fields[5] as String,
      imagepath: fields[6] as String,
      category: fields[7] as String,
      favorite: fields[9] as bool,
      id: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Bookmodel obj) {
    writer
      ..writeByte(9)
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
      ..write(obj.imagepath)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
