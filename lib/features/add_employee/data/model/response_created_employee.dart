import 'package:employee_ni_service/features/add_employee/domain/entities/response_employee_entity.dart';

class ResponseCreatedEmployee extends ResponseEmployeeEntity {
  ResponseCreatedEmployee({required super.message, required super.data});
  factory ResponseCreatedEmployee.fromJson(Map<String, dynamic> json) {
    return ResponseCreatedEmployee(
      message: json['message'] ?? '',
      data: Employee.fromJson(json['data'] ?? {}),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data,
    };
  }
}

class Employee extends EmployeeModel {
  Employee({
    required super.firstName,
    required super.lastName,
    required super.employeeCode,
    required super.dob,
    required super.phone,
    required super.email,
    required super.gender,
    required super.role,
    required super.isActive,
    required super.id,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      employeeCode: json['employeeCode'] ?? '',
      dob: json['dob'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      role: json['role'] ?? '',
      isActive: json['isActive'] ?? '',
      id: json['id'] ?? '',
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
      'id': id,
    };
  }
}
