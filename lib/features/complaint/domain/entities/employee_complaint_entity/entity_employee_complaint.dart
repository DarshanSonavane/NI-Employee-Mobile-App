class EmployeeComplaintEntity {
  final String code;
  final String message;
  final List<DataEntity> data;

  EmployeeComplaintEntity({
    required this.code,
    required this.message,
    required this.data,
  });
}

class DataEntity {
  final String id;
  final String updatedAt;
  final String createdAt;
  final String employeeId;
  final ServiceRequestEntity serviceRequest;
  final int version;

  DataEntity({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.employeeId,
    required this.serviceRequest,
    required this.version,
  });
}

class ServiceRequestEntity {
  final String additionalRequest;
  final String id;
  final String updatedAt;
  final String createdAt;
  final CustomerEntity customer;
  final ComplaintTypeEntity complaintType;
  final String assignedTo;
  final String employeeFeedback;
  final String status;
  final String machineType;
  final int version;
  final String updatedBy;
  final String ratings;

  ServiceRequestEntity({
    required this.additionalRequest,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.customer,
    required this.complaintType,
    required this.assignedTo,
    required this.employeeFeedback,
    required this.status,
    required this.machineType,
    required this.version,
    required this.updatedBy,
    required this.ratings,
  });
}

class CustomerEntity {
  final String machineModel;
  final String id;
  final String customerCode;
  final String customerName;
  final String city;
  final String email;
  final String gstNo;
  final String mobile;
  final String amcDue;
  final String comboMachineNumber;
  final String dieselMachineNumber;
  final String petrolMachineNumber;
  final String stateCode;
  final String machineNumber;

  CustomerEntity({
    required this.machineModel,
    required this.id,
    required this.customerCode,
    required this.customerName,
    required this.city,
    required this.email,
    required this.gstNo,
    required this.mobile,
    required this.amcDue,
    required this.comboMachineNumber,
    required this.dieselMachineNumber,
    required this.petrolMachineNumber,
    required this.stateCode,
    required this.machineNumber,
  });
}

class ComplaintTypeEntity {
  final String id;
  final String name;

  ComplaintTypeEntity({
    required this.id,
    required this.name,
  });
}
