import 'package:employee_ni_service/features/assign_product_by_admin/domain/entities/master_inventory_entity.dart';

class ModelMasterInventory extends MasterInventoryEntity {
  ModelMasterInventory({
    required super.code,
    required super.message,
    required List<InventoryItemModel> super.data,
  });

  factory ModelMasterInventory.fromJson(Map<String, dynamic> json) {
    return ModelMasterInventory(
      code: json['code'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => InventoryItemModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data':
          data.map((item) => (item as InventoryItemModel).toJson()).toList(),
    };
  }
}

class InventoryItemModel extends InventoryItemEntity {
  InventoryItemModel({
    required super.id,
    required super.productName,
    required super.productCode,
    required super.totalQuantity,
    required super.price,
    required super.lastUpdated,
    required super.createdAt,
    required super.updatedAt,
  });

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) {
    return InventoryItemModel(
      id: json['_id'],
      productName: json['productName'],
      productCode: json['productCode'],
      totalQuantity: json['totalQuantity'],
      price: json['price'],
      lastUpdated: json['lastUpdated'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'productName': productName,
      'productCode': productCode,
      'totalQuantity': totalQuantity,
      'price': price,
      'lastUpdated': lastUpdated,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
