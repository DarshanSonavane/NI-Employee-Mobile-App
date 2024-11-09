import 'package:employee_ni_service/features/home/domain/entities/employee_entity.dart';
import '../../domain/entities/home_details.dart';

class ResponseHomeDetails extends HomeDetailsEntity {
  ResponseHomeDetails({
    required super.code,
    required super.message,
    required super.totalComplaints,
    required super.openComplaints,
    required super.closeComplaints,
    required super.employees,
  });

  factory ResponseHomeDetails.fromJson(Map<String, dynamic> json) {
    return ResponseHomeDetails(
      code: json['code'],
      message: json['message'],
      totalComplaints: json['totalComplaints'],
      openComplaints: json['openComplaints'],
      closeComplaints: json['closeComplaints'],
      employees: (json['employees'] as List<dynamic>)
          .map((e) => Employees.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Employees extends EmployeeEntity {
  Employees({
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
    required super.version,
    required super.iV,
    required super.password,
  });

  factory Employees.fromJson(Map<String, dynamic> json) {
    return Employees(
      sId: json['_id'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      isActive: json['isActive'] as String?,
      role: json['role'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      dob: json['dob'] as String?,
      employeeCode: json['employeeCode'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      firstName: json['firstName'] as String?,
      version: json['version'] as int?,
      iV: json['__v'] as int?,
      password: json['password'] as String?,
    );
  }
}
