class RequestAssignProdcut {
  final String productId;
  final String employeeId;
  final int assignedQuantity;
  final String createdBy;

  const RequestAssignProdcut({
    required this.productId,
    required this.employeeId,
    required this.assignedQuantity,
    required this.createdBy,
  });
}
