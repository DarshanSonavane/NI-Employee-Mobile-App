import 'package:employee_ni_service/features/profile/domain/entities/entity_employee_profile.dart';

class ResponseEmployeeProfile extends EntityEmployeeProfile {
  ResponseEmployeeProfile({
    required super.message,
    required super.data,
  });

  factory ResponseEmployeeProfile.fromJson(Map<String, dynamic> json) {
    return ResponseEmployeeProfile(
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<EmployeeDetailsData>.from(
              json["data"]!.map(
                (x) => ResponseEmployeeData.fromJson(x),
              ),
            ),
    );
  }
}

class ResponseEmployeeData extends EmployeeDetailsData {
  ResponseEmployeeData({
    required super.id,
    required super.gender,
    required super.email,
    required super.phone,
    required super.dob,
    required super.employeeCode,
    required super.lastName,
    required super.firstName,
  });

  factory ResponseEmployeeData.fromJson(Map<String, dynamic> json) {
    return ResponseEmployeeData(
      id: json["_id"],
      gender: json["gender"],
      email: json["email"],
      phone: json["phone"],
      dob: json["dob"],
      employeeCode: json["employeeCode"],
      lastName: json["lastName"],
      firstName: json["firstName"],
    );
  }
}
