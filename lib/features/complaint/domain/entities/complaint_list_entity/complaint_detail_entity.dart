class ComplaintDetailsEntity {
  final String message;
  final List<ServiceRequest> data;

  ComplaintDetailsEntity({
    required this.message,
    required this.data,
  });
}

class ServiceRequest {
  final String id;
  final Customer customerId;
  final String machineType;
  final ComplaintType complaintType;
  final String status;
  final String? employeeFeedback;
  final Employee? assignedTo;
  final String? additionalReq;
  final DateTime createdAt;
  final DateTime updatedAt;

  ServiceRequest({
    required this.id,
    required this.customerId,
    required this.machineType,
    required this.complaintType,
    required this.status,
    this.employeeFeedback,
    this.assignedTo,
    this.additionalReq,
    required this.createdAt,
    required this.updatedAt,
  });
}

class Customer {
  final String id;
  final String customerCode;
  final String customerName;
  final String city;
  final String email;
  final String gstNo;
  final String mobile;
  final String amcDue;
  final String password;
  final String? comboMachineNumber;
  final String dieselMachineNumber;
  final String petrolMachineNumber;
  final String stateCode;

  Customer({
    required this.id,
    required this.customerCode,
    required this.customerName,
    required this.city,
    required this.email,
    required this.gstNo,
    required this.mobile,
    required this.amcDue,
    required this.password,
    this.comboMachineNumber,
    required this.dieselMachineNumber,
    required this.petrolMachineNumber,
    required this.stateCode,
  });
}

class ComplaintType {
  final String id;
  final String name;

  ComplaintType({
    required this.id,
    required this.name,
  });
}

class Employee {
  final String id;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String email;
  final String phone;
  final String dob;
  final String employeeCode;
  final String role;
  final String gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String password;
  final bool isActive;

  Employee({
    required this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.dob,
    required this.employeeCode,
    required this.role,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.password,
    required this.isActive,
  });
}
