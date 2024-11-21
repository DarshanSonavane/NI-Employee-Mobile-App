import 'dart:convert';
import 'package:employee_ni_service/features/calibration/domain/entities/delete_calibration_item_entity/response_delete_calibration_item.dart';

class ResponseDeleteCalibrationModel extends ResponseDeleteCalibrationItem {
  ResponseDeleteCalibrationModel({
    required super.code,
    required super.message,
  });

  factory ResponseDeleteCalibrationModel.fromMap(Map<String, dynamic> map) {
    return ResponseDeleteCalibrationModel(
      code: map['code'] != null ? map['code'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  factory ResponseDeleteCalibrationModel.fromJson(String source) =>
      ResponseDeleteCalibrationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
