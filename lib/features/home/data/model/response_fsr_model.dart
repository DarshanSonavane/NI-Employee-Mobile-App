import '../../domain/entities/entity_fsr_list.dart';

class ResponseFsrModel extends FsrEntity {
  ResponseFsrModel({
    required super.message,
    required super.code,
    required List<FsrDataModel> super.fsrData,
  });

  factory ResponseFsrModel.fromJson(Map<String, dynamic> json) {
    return ResponseFsrModel(
      message: json['message'],
      code: json['code'],
      fsrData: List<FsrDataModel>.from(
        json['fsrData'].map((x) => FsrDataModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'fsrData': fsrData.map((x) => (x as FsrDataModel).toJson()).toList(),
    };
  }
}

class FsrDataModel extends FsrDataEntity {
  FsrDataModel({
    required super.id,
    required super.customerCode,
    required super.contactPerson,
    required super.designation,
    required super.employeeCode,
    required super.complaintType,
    required super.natureOfCompliant,
    required List<ProductUsedModel> super.productsUsed,
    required super.remark,
    required super.correctiveAction,
    required super.status,
    required super.serviceDetails,
    required super.fsrLocation,
    required super.fsrStatus,
    required CustomerInfoModel super.customerInfo,
    required EmployeeInfoModel super.employeeInfo,
    required super.fsrFinalAmount,
    required super.fsrFinalGstAmount,
    required super.serviceCharge,
  });

  factory FsrDataModel.fromJson(Map<String, dynamic> json) {
    return FsrDataModel(
      id: json['_id'],
      customerCode: json['customerCode'],
      contactPerson: json['contactPerson'],
      designation: json['designation'],
      employeeCode: json['employeeCode'],
      complaintType: json['complaintType'],
      natureOfCompliant: json['natureOfCall'] ?? "",
      productsUsed: List<ProductUsedModel>.from(
        json['productsUsed'].map((x) => ProductUsedModel.fromJson(x)),
      ),
      remark: json['remark'],
      correctiveAction: json['correctiveAction'],
      status: json['status'],
      serviceDetails: json['serviceDetails'],
      fsrLocation: json['fsrLocation'],
      fsrStatus: json['fsrStatus'],
      customerInfo: CustomerInfoModel.fromJson(json['customerInfo']),
      employeeInfo: EmployeeInfoModel.fromJson(json['employeeInfo']),
      fsrFinalAmount: json['fsrFinalAmount'],
      fsrFinalGstAmount: json['totalGSTAmount'],
      serviceCharge: json['serviceVisit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'customerCode': customerCode,
      'contactPerson': contactPerson,
      'designation': designation,
      'employeeCode': employeeCode,
      'complaintType': complaintType,
      'natureOfCall': natureOfCompliant,
      'productsUsed':
          productsUsed.map((x) => (x as ProductUsedModel).toJson()).toList(),
      'remark': remark,
      'correctiveAction': correctiveAction,
      'status': status,
      'serviceDetails': serviceDetails,
      'fsrLocation': fsrLocation,
      'fsrStatus': fsrStatus,
      'customerInfo': (customerInfo as CustomerInfoModel).toJson(),
      'employeeInfo': (employeeInfo as EmployeeInfoModel).toJson(),
      'fsrFinalAmount': fsrFinalAmount,
      'totalGSTAmount': fsrFinalGstAmount,
      'serviceVisit': serviceCharge,
    };
  }
}

class ProductUsedModel extends ProductUsedEntity {
  ProductUsedModel({
    required super.productName,
    required super.quantityUsed,
    required super.chargeable,
    required super.rate,
    required super.amount,
    required super.gstAmount,
    required super.id,
  });

  factory ProductUsedModel.fromJson(Map<String, dynamic> json) {
    return ProductUsedModel(
      productName: json['productName'] ?? "",
      quantityUsed: json['quantityUsed'] ?? "",
      chargeable: json['chargeable'] ?? "",
      rate: json['rate'] ?? "",
      amount: json['amount'] ?? "",
      gstAmount: json['gstAmount'] ?? "",
      id: json['_id'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'quantityUsed': quantityUsed,
      'chargeable': chargeable,
      'rate': rate,
      'amount': amount,
      'gstAmount': gstAmount,
      '_id': id,
    };
  }
}

class CustomerInfoModel extends CustomerInfoEntity {
  CustomerInfoModel({
    required super.stateCode,
    required super.customerName,
    required super.city,
  });

  factory CustomerInfoModel.fromJson(Map<String, dynamic> json) {
    return CustomerInfoModel(
      stateCode: json['stateCode'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      city: json['city'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stateCode': stateCode,
      'customerName': customerName,
      'city': city,
    };
  }
}

class EmployeeInfoModel extends EmployeeInfoEntity {
  EmployeeInfoModel({
    required super.firstName,
    required super.lastName,
  });

  factory EmployeeInfoModel.fromJson(Map<String, dynamic> json) {
    return EmployeeInfoModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
