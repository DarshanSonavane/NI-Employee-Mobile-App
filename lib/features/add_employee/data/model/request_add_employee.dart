import 'package:employee_ni_service/features/add_employee/domain/entities/add_employee_entity.dart';

class RequestAddEmployee extends AddEmployeeEntity {
  RequestAddEmployee({
    required super.firstName,
    required super.lastName,
    required super.employeeCode,
    required super.dob,
    required super.phone,
    required super.email,
    required super.gender,
    required super.role,
    required super.isActive,
  });

  factory RequestAddEmployee.fromJson(Map<String, dynamic> json) {
    return RequestAddEmployee(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      employeeCode: json['employeeCode'] as String,
      dob: json['dob'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      role: json['role'] as String,
      isActive: json['isActive'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'employeeCode': employeeCode,
      'dob': dob,
      'phone': phone,
      'email': email,
      'gender': gender,
      'role': role,
      'isActive': isActive,
    };
  }
}
