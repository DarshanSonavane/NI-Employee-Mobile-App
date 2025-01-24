class EmployeeComplaintModel {
  EmployeeComplaintModel({
    required this.code,
    required this.message,
    required this.data,
  });

  final String? code;
  final String? message;
  final List<Datum> data;

  factory EmployeeComplaintModel.fromJson(Map<String, dynamic> json) {
    return EmployeeComplaintModel(
      code: json["code"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.employeeId,
    required this.serviceRequestId,
    required this.v,
  });

  final String? id;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final String? employeeId;
  final ServiceRequestId? serviceRequestId;
  final int? v;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["_id"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      employeeId: json["employeeId"],
      serviceRequestId: json["serviceRequestId"] == null
          ? null
          : ServiceRequestId.fromJson(json["serviceRequestId"]),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "employeeId": employeeId,
        "serviceRequestId": serviceRequestId?.toJson(),
        "__v": v,
      };
}

class ServiceRequestId {
  ServiceRequestId({
    required this.additionalReq,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.customerId,
    required this.complaintType,
    required this.assignedTo,
    required this.employeeFeedback,
    required this.status,
    required this.machineType,
    required this.v,
    required this.updatedBy,
    required this.ratings,
  });

  final String? additionalReq;
  final String? id;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final CustomerId? customerId;
  final ComplaintType? complaintType;
  final String? assignedTo;
  final String? employeeFeedback;
  final String? status;
  final String? machineType;
  final int? v;
  final String? updatedBy;
  final String? ratings;

  factory ServiceRequestId.fromJson(Map<String, dynamic> json) {
    return ServiceRequestId(
      additionalReq: json["additionalReq"],
      id: json["_id"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      customerId: json["customerId"] == null
          ? null
          : CustomerId.fromJson(json["customerId"]),
      complaintType: json["complaintType"] == null
          ? null
          : ComplaintType.fromJson(json["complaintType"]),
      assignedTo: json["assignedTo"],
      employeeFeedback: json["employeeFeedback"],
      status: json["status"],
      machineType: json["machineType"],
      v: json["__v"],
      updatedBy: json["updatedBy"],
      ratings: json["ratings"],
    );
  }

  Map<String, dynamic> toJson() => {
        "additionalReq": additionalReq,
        "_id": id,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "customerId": customerId?.toJson(),
        "complaintType": complaintType?.toJson(),
        "assignedTo": assignedTo,
        "employeeFeedback": employeeFeedback,
        "status": status,
        "machineType": machineType,
        "__v": v,
        "updatedBy": updatedBy,
        "ratings": ratings,
      };
}

class ComplaintType {
  ComplaintType({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory ComplaintType.fromJson(Map<String, dynamic> json) {
    return ComplaintType(
      id: json["_id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class CustomerId {
  CustomerId({
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
    required this.password,
    required this.v,
    required this.machineNumber,
  });

  final String? machineModel;
  final String? id;
  final String? customerCode;
  final String? customerName;
  final String? city;
  final String? email;
  final String? gstNo;
  final String? mobile;
  final DateTime? amcDue;
  final String? comboMachineNumber;
  final String? dieselMachineNumber;
  final String? petrolMachineNumber;
  final String? stateCode;
  final String? password;
  final int? v;
  final String? machineNumber;

  factory CustomerId.fromJson(Map<String, dynamic> json) {
    return CustomerId(
      machineModel: json["machineModel"],
      id: json["_id"],
      customerCode: json["customerCode"],
      customerName: json["customerName"],
      city: json["city"],
      email: json["email"],
      gstNo: json["gstNo"],
      mobile: json["mobile"],
      amcDue: DateTime.tryParse(json["amcDue"] ?? ""),
      comboMachineNumber: json["comboMachineNumber"],
      dieselMachineNumber: json["dieselMachineNumber"],
      petrolMachineNumber: json["petrolMachineNumber"],
      stateCode: json["stateCode"],
      password: json["password"],
      v: json["__v"],
      machineNumber: json["machineNumber"],
    );
  }

  Map<String, dynamic> toJson() => {
        "machineModel": machineModel,
        "_id": id,
        "customerCode": customerCode,
        "customerName": customerName,
        "city": city,
        "email": email,
        "gstNo": gstNo,
        "mobile": mobile,
        "amcDue": amcDue?.toIso8601String(),
        "comboMachineNumber": comboMachineNumber,
        "dieselMachineNumber": dieselMachineNumber,
        "petrolMachineNumber": petrolMachineNumber,
        "stateCode": stateCode,
        "password": password,
        "__v": v,
        "machineNumber": machineNumber,
      };
}
