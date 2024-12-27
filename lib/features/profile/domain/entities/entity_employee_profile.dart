class EntityEmployeeProfile {
  final String message;
  final List<EmployeeDetailsData> data;

  EntityEmployeeProfile({
    required this.message,
    required this.data,
  });
}

class EmployeeDetailsData {
  final String id;
  final String gender;
  final String email;
  final String phone;
  final String dob;
  final String employeeCode;
  final String lastName;
  final String firstName;

  EmployeeDetailsData({
    required this.id,
    required this.gender,
    required this.email,
    required this.phone,
    required this.dob,
    required this.employeeCode,
    required this.lastName,
    required this.firstName,
  });
}
