class RequestCreateFSREntity {
  final String customerCode;
  final String contactPerson;
  final String designation;
  final String employeeCode;
  final String model;
  final String employeeId;
  final String complaintType;
  final String natureOfCompliant;
  final List<ProductUsedEntity> productsUsed;
  final String remark;
  final String correctiveAction;
  final String status;
  final String serviceDetails;
  final String employeeSignature;
  final String customerSignature;
  final String fsrLocation;
  final String fstStartTime;
  final String fsrEndTime;
  final double finalTotalAmount;
  final double totalGSTAmount;
  final String complaint;

  RequestCreateFSREntity(
      {required this.customerCode,
      required this.contactPerson,
      required this.designation,
      required this.employeeCode,
      required this.model,
      required this.employeeId,
      required this.complaintType,
      required this.natureOfCompliant,
      required this.productsUsed,
      required this.remark,
      required this.correctiveAction,
      required this.status,
      required this.serviceDetails,
      required this.employeeSignature,
      required this.customerSignature,
      required this.fsrLocation,
      required this.fstStartTime,
      required this.fsrEndTime,
      required this.finalTotalAmount,
      required this.totalGSTAmount,
      required this.complaint});
}

class ProductUsedEntity {
  final String productName;
  final int quantityUsed;
  final String rate;
  final double amount;
  final String chargable;
  final double gstAmount;
  final String productId;
  final String productCode;

  ProductUsedEntity(
      {required this.productName,
      required this.quantityUsed,
      required this.rate,
      required this.amount,
      required this.chargable,
      required this.gstAmount,
      required this.productId,
      required this.productCode});
}
