import 'dart:convert';
import 'package:employee_ni_service/features/calibration/domain/entities/calibration_details_entity/employee_id.dart';

class ResponseEmployeeid extends EmployeeId {
  ResponseEmployeeid({
    required super.sId,
    required super.updatedAt,
    required super.createdAt,
    required super.isActive,
    required super.role,
    required super.gender,
    required super.email,
    required super.phone,
    required super.dob,
    required super.employeeCode,
    required super.lastName,
    required super.middleName,
    required super.firstName,
    required super.iV,
    required super.password,
  });

  factory ResponseEmployeeid.fromMap(Map<String, dynamic> map) {
    return ResponseEmployeeid(
      sId: map['_id'] != null ? map['_id'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      employeeCode:
          map['employeeCode'] != null ? map['employeeCode'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      middleName:
          map['middleName'] != null ? map['middleName'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      iV: map['__v'] != null ? map['__v'] as int : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  factory ResponseEmployeeid.fromJson(String source) =>
      ResponseEmployeeid.fromMap(json.decode(source) as Map<String, dynamic>);
}
