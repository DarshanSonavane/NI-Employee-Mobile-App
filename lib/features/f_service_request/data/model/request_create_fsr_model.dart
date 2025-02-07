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
    required super.chargable,
    required super.complaint,
  });

  factory RequestCreateFSRModel.fromJson(Map<String, dynamic> json) {
    return RequestCreateFSRModel(
        customerCode: json['customerCode'],
        contactPerson: json['contactPerson'],
        designation: json['designation'],
        employeeCode: json['employeeCode'],
        model: json['model'],
        employeeId: json['employeeId'],
        complaintType: json['complaintType'],
        natureOfCompliant: json['natureOfCall'],
        productsUsed: (json['productsUsed'] as List)
            .map((product) => ProductUsedEntity(
                  productName: product['productName'],
                  quantityUsed: product['quantityUsed'],
                  rate: product['rate'],
                  amount: product['amount'],
                  gstAmount: product['gstAmount'],
                  productId: product['_id'],
                ))
            .toList(),
        remark: json['remark'],
        correctiveAction: json['correctiveAction'],
        status: json['status'],
        serviceDetails: json['serviceDetails'],
        employeeSignature: json['employeeSignature'],
        customerSignature: json['customerSignature'],
        fsrLocation: json['fsrLocation'],
        fstStartTime: json['fsrStartTime'],
        fsrEndTime: json['fsrEndTime'],
        finalTotalAmount: json['fsrFinalAmount'],
        chargable: json['isChargeable'],
        complaint: json['complaint']);
  }

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
      'productsUsed': productsUsed
          .map((product) => {
                'productName': product.productName,
                'quantityUsed': product.quantityUsed,
                'rate': product.rate,
                'amount': product.amount,
                'gstAmount': product.gstAmount,
                '_id': product.productId,
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
      'isChargeable': chargable,
      'complaint': complaint
    };
  }
}
