import 'dart:convert';

import 'package:employee_ni_service/features/calibration/data/model/model_calibration_details/response_customerid.dart';

import '../../../domain/entities/calibration_details_entity/data.dart';
import 'response_employeeid.dart';

class ResponseData extends Data {
  ResponseData({
    required super.sId,
    required super.customerId,
    required super.machineType,
    required super.employeeId,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.iV,
  });

  factory ResponseData.fromMap(Map<String, dynamic> map) {
    return ResponseData(
      sId: map['_id'] != null ? map['_id'] as String : null,
      customerId: map['customerId'] != null
          ? ResponseCustomerid.fromMap(
              map['customerId'] as Map<String, dynamic>)
          : null,
      machineType:
          map['machineType'] != null ? map['machineType'] as String : null,
      employeeId: map['employeeId'] != null
          ? ResponseEmployeeid.fromMap(
              map['employeeId'] as Map<String, dynamic>)
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      iV: map['__v'] != null ? map['__v'] as int : null,
    );
  }

  factory ResponseData.fromJson(String source) =>
      ResponseData.fromMap(json.decode(source) as Map<String, dynamic>);
}
