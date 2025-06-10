import 'package:employee_ni_service/features/assign_product_by_admin/domain/entities/request_assign_prodcut.dart';

class ProductAssignmentModel extends RequestAssignProdcut {
  const ProductAssignmentModel({
    required super.productId,
    required super.employeeId,
    required super.assignedQuantity,
    required super.createdBy,
  });

  factory ProductAssignmentModel.fromJson(Map<String, dynamic> json) {
    return ProductAssignmentModel(
      productId: json['productId'],
      employeeId: json['employeeId'],
      assignedQuantity: int.parse(json['assignedQuantity']),
      createdBy: json['createdBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'employeeId': employeeId,
      'assignedQuantity': assignedQuantity.toString(),
      'createdBy': createdBy,
    };
  }
}
