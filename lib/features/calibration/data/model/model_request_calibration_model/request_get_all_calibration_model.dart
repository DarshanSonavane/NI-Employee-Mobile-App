import 'dart:convert';
import 'package:employee_ni_service/features/calibration/domain/entities/request_get_all_calibration_entity/request_all_calibration_entity.dart';

class RequestGetAllCalibrationModel extends RequestAllCalibrationEntity {
  RequestGetAllCalibrationModel({
    required super.employeeId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employeeId': employeeId,
    };
  }

  String toJson() => json.encode(toMap());
}
