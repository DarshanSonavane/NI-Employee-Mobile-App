import 'data.dart';

class CalibrationRequestEntity {
  final String? code;
  final String? message;
  final List<Data>? data;

  CalibrationRequestEntity({
    required this.code,
    required this.message,
    required this.data,
  });
}
