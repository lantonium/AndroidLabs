// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginLocalAdapter extends TypeAdapter<LoginLocal> {
  @override
  final int typeId = 0;

  @override
  LoginLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginLocal()
      ..email = fields[0] as String?
      ..contrasena = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, LoginLocal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.contrasena);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
