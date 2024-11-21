import 'dart:convert';
import 'package:employee_ni_service/features/calibration/domain/entities/delete_calibration_item_entity/request_delete_calibration.dart';

class RequestDeleteCalibrationModel extends RequestDeleteCalibration {
  RequestDeleteCalibrationModel({
    required super.calibrationId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'calibrationId': calibrationId,
    };
  }

  String toJson() => json.encode(toMap());
}
