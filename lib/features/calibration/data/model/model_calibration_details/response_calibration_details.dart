import 'dart:convert';

import 'package:employee_ni_service/features/calibration/data/model/model_calibration_details/response_data.dart';
import 'package:employee_ni_service/features/calibration/domain/entities/calibration_details_entity/calibration_request_entity.dart';

class ResponseCalibrationDetails extends CalibrationRequestEntity {
  ResponseCalibrationDetails({
    required super.code,
    required super.message,
    required super.data,
  });

  factory ResponseCalibrationDetails.fromMap(Map<String, dynamic> map) {
    return ResponseCalibrationDetails(
      code: map['code'] != null ? map['code'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<ResponseData>.from(
              (map['data'] as List<dynamic>).map<ResponseData?>(
                (x) => ResponseData.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory ResponseCalibrationDetails.fromJson(String source) =>
      ResponseCalibrationDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
