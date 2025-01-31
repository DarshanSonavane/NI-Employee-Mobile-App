class FsrEntity {
  final String message;
  final int code;
  final List<FsrDataEntity> fsrData;

  FsrEntity({
    required this.message,
    required this.code,
    required this.fsrData,
  });
}

class FsrDataEntity {
  final String id;
  final String customerCode;
  final String contactPerson;
  final String designation;
  final String employeeCode;
  final String complaintType;
  final String natureOfCompliant;
  final List<ProductUsedEntity> productsUsed;
  final String remark;
  final String correctiveAction;
  final String status;
  final String serviceDetails;
  final String fsrLocation;
  final String fsrStatus;
  final CustomerInfoEntity customerInfo;
  final EmployeeInfoEntity employeeInfo;

  FsrDataEntity({
    required this.id,
    required this.customerCode,
    required this.contactPerson,
    required this.designation,
    required this.employeeCode,
    required this.complaintType,
    required this.natureOfCompliant,
    required this.productsUsed,
    required this.remark,
    required this.correctiveAction,
    required this.status,
    required this.serviceDetails,
    required this.fsrLocation,
    required this.fsrStatus,
    required this.customerInfo,
    required this.employeeInfo,
  });
}

class ProductUsedEntity {
  final String productName;
  final int quantityUsed;
  final String chargeable;
  final String rate;
  final String amount;
  final String gstAmount;
  final String id;

  ProductUsedEntity({
    required this.productName,
    required this.quantityUsed,
    required this.chargeable,
    required this.rate,
    required this.amount,
    required this.gstAmount,
    required this.id,
  });
}

class CustomerInfoEntity {
  final String stateCode;
  final String customerName;
  final String city;

  CustomerInfoEntity({
    required this.stateCode,
    required this.customerName,
    required this.city,
  });
}

class EmployeeInfoEntity {
  final String firstName;
  final String lastName;

  EmployeeInfoEntity({
    required this.firstName,
    required this.lastName,
  });
}
