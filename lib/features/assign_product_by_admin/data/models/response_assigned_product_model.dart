import 'package:employee_ni_service/features/assign_product_by_admin/domain/entities/response_assign_product.dart';

class ResponseAssignedProductModel extends ResponseAssignProduct {
  const ResponseAssignedProductModel({
    required super.message,
    required EmployeeInventoryDataModel super.data,
  });

  factory ResponseAssignedProductModel.fromJson(Map<String, dynamic> json) {
    return ResponseAssignedProductModel(
      message: json['message'] ?? '',
      data: EmployeeInventoryDataModel.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "data": data,
    };
  }
}

class EmployeeInventoryDataModel extends EmployeeInventoryDataEntity {
  const EmployeeInventoryDataModel({
    required super.acknowledged,
    required super.modifiedCount,
    required super.upsertedId,
    required super.upsertedCount,
    required super.matchedCount,
  });

  factory EmployeeInventoryDataModel.fromJson(Map<String, dynamic> json) {
    return EmployeeInventoryDataModel(
      acknowledged: json['acknowledged'] ?? false,
      modifiedCount: json['modifiedCount'] ?? 0,
      upsertedId: json['upsertedId'],
      upsertedCount: json['upsertedCount'] ?? 0,
      matchedCount: json['matchedCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "acknowledged": acknowledged,
      "modifiedCount": modifiedCount,
      "upsertedId": upsertedId,
      "upsertedCount": upsertedCount,
      "matchedCount": matchedCount,
    };
  }
}
