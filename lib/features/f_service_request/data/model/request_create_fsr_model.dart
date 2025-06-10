import '../../domain/entities/request_create_fsr_entity.dart';

class RequestCreateFSRModel extends RequestCreateFSREntity {
  RequestCreateFSRModel({
    required super.customerCode,
    required super.contactPerson,
    required super.designation,
    required super.employeeCode,
    required super.model,
    required super.employeeId,
    required super.complaintType,
    required super.natureOfCompliant,
    required super.productsUsed,
    required super.remark,
    required super.correctiveAction,
    required super.status,
    required super.serviceDetails,
    required super.employeeSignature,
    required super.customerSignature,
    required super.fsrLocation,
    required super.fstStartTime,
    required super.fsrEndTime,
    required super.finalTotalAmount,
    required super.complaint,
    required super.totalGSTAmount,
  });

  Map<String, dynamic> toJson() {
    return {
      'customerCode': customerCode,
      'contactPerson': contactPerson,
      'designation': designation,
      'employeeCode': employeeCode,
      'model': model,
      'employeeId': employeeId,
      'complaintType': complaintType,
      'natureOfCall': natureOfCompliant,
      'productsUsed': productsUsed!.isEmpty
          ? null
          : productsUsed!
              .map((product) => {
                    'productName': product.productName,
                    'quantityUsed': product.quantityUsed,
                    'rate': product.rate,
                    'amount': product.amount,
                    'gstAmount': product.gstAmount,
                    '_id': product.productId,
                    'productCode': product.productCode,
                    'chargeable': product.chargable
                  })
              .toList(),
      'remark': remark,
      'correctiveAction': correctiveAction,
      'status': status,
      'serviceDetails': serviceDetails,
      'employeeSignature': employeeSignature,
      'customerSignature': customerSignature,
      'fsrLocation': fsrLocation,
      'fsrStartTime': fstStartTime,
      'fsrEndTime': fsrEndTime,
      'fsrFinalAmount': finalTotalAmount,
      'complaint': complaint,
      'totalGSTAmount': totalGSTAmount,
    };
  }
}
