import 'package:employee_ni_service/features/complaint/domain/entities/employee_complaint_entity/entity_employee_complaint.dart';

class EmployeeComplaintModel extends EmployeeComplaintEntity {
  EmployeeComplaintModel({
    required super.code,
    required super.message,
    required super.data,
  });

  factory EmployeeComplaintModel.fromMap(Map<String, dynamic> map) {
    return EmployeeComplaintModel(
      code: map['code'] as String,
      message: map['message'] as String,
      data: List<DataModel>.from(
        (map['data'] as List<int>).map<DataModel>(
          (x) => DataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class DataModel extends DataEntity {
  DataModel({
    required super.id,
    required super.updatedAt,
    required super.createdAt,
    required super.employeeId,
    required super.serviceRequest,
    required super.version,
  });

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'] as String,
      updatedAt: map['updatedAt'] as String,
      createdAt: map['createdAt'] as String,
      employeeId: map['employeeId'] as String,
      serviceRequest: ServiceRequestModel.fromMap(
          map['serviceRequest'] as Map<String, dynamic>),
      version: map['version'] as int,
    );
  }
}

class ServiceRequestModel extends ServiceRequestEntity {
  ServiceRequestModel({
    required super.additionalRequest,
    required super.id,
    required super.updatedAt,
    required super.createdAt,
    required super.customer,
    required super.complaintType,
    required super.assignedTo,
    required super.employeeFeedback,
    required super.status,
    required super.machineType,
    required super.version,
    required super.updatedBy,
    required super.ratings,
  });

  factory ServiceRequestModel.fromMap(Map<String, dynamic> map) {
    return ServiceRequestModel(
      additionalRequest: map['additionalRequest'] as String,
      id: map['id'] as String,
      updatedAt: map['updatedAt'] as String,
      createdAt: map['createdAt'] as String,
      customer: CustomerModel.fromMap(map['customer'] as Map<String, dynamic>),
      complaintType: ComplaintTypeModel.fromMap(
          map['complaintType'] as Map<String, dynamic>),
      assignedTo: map['assignedTo'] as String,
      employeeFeedback: map['employeeFeedback'] as String,
      status: map['status'] as String,
      machineType: map['machineType'] as String,
      version: map['version'] as int,
      updatedBy: map['updatedBy'] as String,
      ratings: map['ratings'] as String,
    );
  }
}

class CustomerModel extends CustomerEntity {
  CustomerModel({
    required super.machineModel,
    required super.id,
    required super.customerCode,
    required super.customerName,
    required super.city,
    required super.email,
    required super.gstNo,
    required super.mobile,
    required super.amcDue,
    required super.comboMachineNumber,
    required super.dieselMachineNumber,
    required super.petrolMachineNumber,
    required super.stateCode,
    required super.machineNumber,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      machineModel: map['machineModel'] as String,
      id: map['id'] as String,
      customerCode: map['customerCode'] as String,
      customerName: map['customerName'] as String,
      city: map['city'] as String,
      email: map['email'] as String,
      gstNo: map['gstNo'] as String,
      mobile: map['mobile'] as String,
      amcDue: map['amcDue'] as String,
      comboMachineNumber: map['comboMachineNumber'] as String,
      dieselMachineNumber: map['dieselMachineNumber'] as String,
      petrolMachineNumber: map['petrolMachineNumber'] as String,
      stateCode: map['stateCode'] as String,
      machineNumber: map['machineNumber'] as String,
    );
  }
}

class ComplaintTypeModel extends ComplaintTypeEntity {
  ComplaintTypeModel({
    required super.id,
    required super.name,
  });

  factory ComplaintTypeModel.fromMap(Map<String, dynamic> map) {
    return ComplaintTypeModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}
