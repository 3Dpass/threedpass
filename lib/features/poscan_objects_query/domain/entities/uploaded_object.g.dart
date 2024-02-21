// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UploadedObjectAdapter extends TypeAdapter<UploadedObject> {
  @override
  final int typeId = 9;

  @override
  UploadedObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UploadedObject(
      id: fields[1] as int,
      raw: (fields[0] as Map).cast<dynamic, dynamic>(),
      cacheDate: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UploadedObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.raw)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.cacheDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadedObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
