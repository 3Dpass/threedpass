// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConnectionModeAdapter extends TypeAdapter<ConnectionMode> {
  @override
  final int typeId = 11;

  @override
  ConnectionMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ConnectionMode.defaultRandom;
      case 1:
        return ConnectionMode.custom;
      default:
        return ConnectionMode.defaultRandom;
    }
  }

  @override
  void write(BinaryWriter writer, ConnectionMode obj) {
    switch (obj) {
      case ConnectionMode.defaultRandom:
        writer.writeByte(0);
        break;
      case ConnectionMode.custom:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectionModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
