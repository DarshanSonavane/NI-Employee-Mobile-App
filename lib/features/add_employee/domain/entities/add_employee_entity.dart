class AddEmployeeEntity {
  final String firstName;
  final String lastName;
  final String employeeCode;
  final String dob;
  final String phone;
  final String email;
  final String gender;
  final String role;
  final String isActive;

  const AddEmployeeEntity({
    required this.firstName,
    required this.lastName,
    required this.employeeCode,
    required this.dob,
    required this.phone,
    required this.email,
    required this.gender,
    required this.role,
    required this.isActive,
  });
}
