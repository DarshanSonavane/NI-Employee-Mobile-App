import 'package:hive/hive.dart';

part 'login_response_params.g.dart';

@HiveType(typeId: 1)
class LoginResponseParams {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String updatedAt;
  @HiveField(2)
  final String createdAt;
  @HiveField(3)
  final String isActive;
  @HiveField(4)
  final String role;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final String email;
  @HiveField(7)
  final String phone;
  @HiveField(8)
  final String dob;
  @HiveField(9)
  final String employeeCode;
  @HiveField(10)
  final String lastName;
  @HiveField(11)
  final String? middleName;
  @HiveField(12)
  final String firstName;
  @HiveField(13)
  final String password;

  LoginResponseParams({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.isActive,
    required this.role,
    required this.gender,
    required this.email,
    required this.phone,
    required this.dob,
    required this.employeeCode,
    required this.lastName,
    this.middleName,
    required this.firstName,
    required this.password,
  });

  factory LoginResponseParams.fromJson(Map<String, dynamic> json) {
    return LoginResponseParams(
      id: json['_id'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      isActive: json['isActive'],
      role: json['role'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      dob: json['dob'],
      employeeCode: json['employeeCode'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      firstName: json['firstName'],
      password: json['password'],
    );
  }
}
