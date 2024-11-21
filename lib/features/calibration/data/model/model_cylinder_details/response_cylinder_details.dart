import 'package:employee_ni_service/features/calibration/data/model/model_cylinder_details/response_cylinder_data.dart';
import 'package:employee_ni_service/features/calibration/domain/entities/cylinder_details_entity.dart/cylinder_main_entity.dart';

import '../../../domain/entities/cylinder_details_entity.dart/cylinder_data.dart';

class ResponseCylinderDetails extends CylinderMainEntity {
  ResponseCylinderDetails({
    required super.code,
    required super.message,
    required super.cylinderData,
  });

  factory ResponseCylinderDetails.fromMap(Map<String, dynamic> map) {
    final List<CylinderData> cylinderData = map['data'] != null
        ? (map['data'] is List
            ? (map['data'] as List)
                .map((x) =>
                    ResponseCylinderData.fromMap(x as Map<String, dynamic>))
                .toList()
            : [
                ResponseCylinderData.fromMap(
                    map['data'] as Map<String, dynamic>)
              ])
        : []; // Fallback to an empty list if 'data' is null

    return ResponseCylinderDetails(
      code: map['code'] ?? '',
      message: map['message'] ?? '',
      cylinderData: cylinderData,
    );
  }
}
