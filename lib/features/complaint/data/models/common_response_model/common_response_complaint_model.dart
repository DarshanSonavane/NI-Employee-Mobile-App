import 'dart:convert';
import 'package:employee_ni_service/features/complaint/domain/entities/common_response_calibration_entity/entity_common_response_calibration.dart';

class CommonResponseComplaintModel extends EntityCommonResponseCalibration {
  CommonResponseComplaintModel({
    required super.code,
    required super.message,
  });

  factory CommonResponseComplaintModel.fromMap(Map<String, dynamic> map) {
    return CommonResponseComplaintModel(
      code: map['code'] != null ? map['code'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  factory CommonResponseComplaintModel.fromJson(String source) =>
      CommonResponseComplaintModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
