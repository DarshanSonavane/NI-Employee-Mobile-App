class SetResetPasswordResponseEntity {
  final String? code;
  final String? message;
  final PasswordUpdateData? data;

  SetResetPasswordResponseEntity({
    required this.code,
    required this.message,
    required this.data,
  });
}

class PasswordUpdateData {
  final bool acknowledged;
  final int modifiedCount;
  final dynamic upsertedId;
  final int upsertedCount;
  final int matchedCount;

  PasswordUpdateData({
    required this.acknowledged,
    required this.modifiedCount,
    required this.upsertedId,
    required this.upsertedCount,
    required this.matchedCount,
  });
}
