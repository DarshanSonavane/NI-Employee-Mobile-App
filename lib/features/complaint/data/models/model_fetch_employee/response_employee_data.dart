import 'dart:convert';

import 'package:employee_ni_service/features/complaint/domain/entities/entity_response_employee_details/employee_data.dart';

class ResponseEmployeeData extends EmployeeData {
  ResponseEmployeeData({
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

  factory ResponseEmployeeData.fromMap(Map<String, dynamic> map) {
    return ResponseEmployeeData(
      sId: map['_id'] as String? ?? '',
      updatedAt: map['updatedAt'] as String? ?? '',
      createdAt: map['createdAt'] as String? ?? '',
      isActive: map['isActive'] as String? ?? '',
      role: map['role'] as String? ?? '',
      gender: map['gender'] as String? ?? '',
      email: map['email'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      dob: map['dob'] as String? ?? '',
      employeeCode: map['employeeCode'] as String? ?? '',
      lastName: map['lastName'] as String? ?? '',
      middleName: map['middleName'] as String? ?? '',
      firstName: map['firstName'] as String? ?? '',
      iV: map['__v'] as int? ?? 0,
      password: map['password'] as String? ?? '',
    );
  }

  factory ResponseEmployeeData.fromJson(String source) =>
      ResponseEmployeeData.fromMap(json.decode(source) as Map<String, dynamic>);
}
