import 'package:employee_ni_service/features/home/domain/entities/entity_request_fsr.dart'; // Import the entity file

class RequestFsrModel extends EntityRequestFsr {
  RequestFsrModel({
    required super.role,
    required super.employeeId,
  });

  factory RequestFsrModel.fromJson(Map<String, dynamic> json) {
    return RequestFsrModel(
      role: json['role'],
      employeeId: json['employeeId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'employeeId': employeeId,
    };
  }
}
