class InsertUpdateProductEntity {
  final String productName;
  final String productCode;
  final String? productId;
  final int totalQuantity;
  final double price;

  const InsertUpdateProductEntity({
    required this.productName,
    required this.productCode,
    this.productId,
    required this.totalQuantity,
    required this.price,
  });
}
