import 'dart:convert';
import 'package:employee_ni_service/features/products/domain/entities/assigned_emp_product_list.dart';

class ResponseAssignedEmployeeProductList extends AssignedEmpProductList {
  ResponseAssignedEmployeeProductList({
    required super.productId,
    required super.productName,
    required super.productQuantity,
    required super.productPrice,
    required super.productImageUrl,
  });

  factory ResponseAssignedEmployeeProductList.fromMap(
      Map<String, dynamic> map) {
    return ResponseAssignedEmployeeProductList(
      productId: map['product_id'] as String,
      productName: map['product_name'] as String,
      productQuantity: map['available_quantity'] as String,
      productPrice: map['price'] as String,
      productImageUrl: map['url'] as String,
    );
  }

  static List<ResponseAssignedEmployeeProductList> fromJsonList(String source) {
    final List<dynamic> jsonList = json.decode(source);
    return jsonList
        .map((item) => ResponseAssignedEmployeeProductList.fromMap(
            item as Map<String, dynamic>))
        .toList();
  }
}
