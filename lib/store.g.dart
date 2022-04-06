// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HashesModelAdapter extends TypeAdapter<HashesModel> {
  @override
  final int typeId = 0;

  @override
  HashesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HashesModel(
      name: fields[0] as String,
      stamp: fields[1] as String,
      hashes: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HashesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.stamp)
      ..writeByte(2)
      ..write(obj.hashes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HashesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
