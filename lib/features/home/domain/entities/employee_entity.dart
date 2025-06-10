class EmployeeEntity {
  final String? sId;
  final String? updatedAt;
  final String? createdAt;
  final String? isActive;
  final String? role;
  final String? gender;
  final String? email;
  final String? phone;
  final String? dob;
  final String? employeeCode;
  final String? lastName;
  final String? middleName;
  final String? firstName;
  final int? version;
  final int? iV;
  final String? password;

  EmployeeEntity(
      {required this.sId,
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
      required this.middleName,
      required this.firstName,
      required this.version,
      required this.iV,
      required this.password});
}
