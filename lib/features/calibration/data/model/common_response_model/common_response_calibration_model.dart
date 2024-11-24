import 'dart:convert';
import 'package:employee_ni_service/features/calibration/domain/entities/common_response_entity/common_response_calibration.dart';

class CommonResponseCalibrationModel extends CommonResponseCalibration {
  CommonResponseCalibrationModel({
    required super.code,
    required super.message,
  });

  factory CommonResponseCalibrationModel.fromMap(Map<String, dynamic> map) {
    return CommonResponseCalibrationModel(
      code: map['code'] != null ? map['code'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  factory CommonResponseCalibrationModel.fromJson(String source) =>
      CommonResponseCalibrationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
