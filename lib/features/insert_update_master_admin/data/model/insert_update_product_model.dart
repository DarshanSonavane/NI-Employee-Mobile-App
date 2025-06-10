import 'package:employee_ni_service/features/insert_update_master_admin/domain/entities/insert_update_product_entity.dart';

class InsertUpdateProductModel extends InsertUpdateProductEntity {
  const InsertUpdateProductModel({
    required super.productName,
    required super.productCode,
    super.productId,
    required super.totalQuantity,
    required super.price,
  });

  factory InsertUpdateProductModel.fromJson(Map<String, dynamic> json) {
    return InsertUpdateProductModel(
      productName: json['productName'],
      productCode: json['productCode'],
      productId: json['productId'],
      totalQuantity: json['totalQuantity'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productCode': productCode,
      'productId': productId,
      'totalQuantity': totalQuantity,
      'price': price,
    };
  }
}
