import 'dart:convert';

import 'package:employee_ni_service/features/calibration/domain/entities/request_update_cylinder_details_entity.dart/request_update_cylinder.dart';

class RequestUpdateCylinderDetails extends RequestUpdateCylinder {
  RequestUpdateCylinderDetails({
    required super.sId,
    required super.cO,
    required super.cO2,
    required super.hC,
    required super.o2,
    required super.cylinderNumber,
    required super.cylinderMake,
    required super.validityDate,
    required super.createdBy,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': sId,
      'CO': cO,
      'CO2': cO2,
      'HC': hC,
      'O2': o2,
      'cylinderNumber': cylinderNumber,
      'cylinderMake': cylinderMake,
      'validityDate': validityDate,
      'createdBy': createdBy,
    };
  }

  String toJson() => json.encode(toMap());
}
