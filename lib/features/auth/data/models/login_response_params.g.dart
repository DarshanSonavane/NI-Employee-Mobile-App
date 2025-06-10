// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_params.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginResponseParamsAdapter extends TypeAdapter<LoginResponseParams> {
  @override
  final int typeId = 1;

  @override
  LoginResponseParams read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginResponseParams(
      id: fields[0] as String,
      updatedAt: fields[1] as String,
      createdAt: fields[2] as String,
      isActive: fields[3] as String,
      role: fields[4] as String,
      gender: fields[5] as String,
      email: fields[6] as String,
      phone: fields[7] as String,
      dob: fields[8] as String,
      employeeCode: fields[9] as String,
      lastName: fields[10] as String,
      middleName: fields[11] as String?,
      firstName: fields[12] as String,
      password: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginResponseParams obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.updatedAt)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.isActive)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.dob)
      ..writeByte(9)
      ..write(obj.employeeCode)
      ..writeByte(10)
      ..write(obj.lastName)
      ..writeByte(11)
      ..write(obj.middleName)
      ..writeByte(12)
      ..write(obj.firstName)
      ..writeByte(13)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
