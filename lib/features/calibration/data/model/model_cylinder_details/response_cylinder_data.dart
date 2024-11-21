import 'package:employee_ni_service/features/calibration/domain/entities/cylinder_details_entity.dart/cylinder_data.dart';

class ResponseCylinderData extends CylinderData {
  ResponseCylinderData({
    required super.sId,
    required super.cO,
    required super.cO2,
    required super.hC,
    required super.o2,
    required super.cylinderNumber,
    required super.cylinderMake,
    required super.validityDate,
    required super.createdBy,
    required super.createdAt,
    required super.updatedAt,
    required super.iV,
  });

  factory ResponseCylinderData.fromMap(Map<String, dynamic> map) {
    return ResponseCylinderData(
      sId: map['_id'] != null ? map['_id'] as String : null,
      cO: map['CO'] != null ? map['CO'] as String : null,
      cO2: map['CO2'] != null ? map['CO2'] as String : null,
      hC: map['HC'] != null ? map['HC'] as String : null,
      o2: map['O2'] != null ? map['O2'] as String : null,
      cylinderNumber: map['cylinderNumber'] != null
          ? map['cylinderNumber'] as String
          : null,
      cylinderMake:
          map['cylinderMake'] != null ? map['cylinderMake'] as String : null,
      validityDate:
          map['validityDate'] != null ? map['validityDate'] as String : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      iV: map['__v'] != null ? map['__v'] as int : null,
    );
  }
}
