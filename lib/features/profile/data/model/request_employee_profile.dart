import 'package:employee_ni_service/features/profile/domain/entities/entity_request_employee.dart';

class RequestEmployeeProfile extends EntityRequestEmployee {
  RequestEmployeeProfile({required super.employeeId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employeeId': employeeId,
    };
  }
}
