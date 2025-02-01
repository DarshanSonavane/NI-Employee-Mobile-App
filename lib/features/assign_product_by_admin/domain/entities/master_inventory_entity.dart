class MasterInventoryEntity {
  final String code;
  final String message;
  final List<InventoryItemEntity> data;

  MasterInventoryEntity({
    required this.code,
    required this.message,
    required this.data,
  });
}

class InventoryItemEntity {
  final String id;
  final String productName;
  final String productCode;
  final int totalQuantity;
  final int price;
  final String lastUpdated;
  final String createdAt;
  final String updatedAt;

  InventoryItemEntity({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.totalQuantity,
    required this.price,
    required this.lastUpdated,
    required this.createdAt,
    required this.updatedAt,
  });
}
