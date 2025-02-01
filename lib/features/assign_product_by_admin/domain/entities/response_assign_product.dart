class ResponseAssignProduct {
  final String message;
  final EmployeeInventoryDataEntity data;

  const ResponseAssignProduct({
    required this.message,
    required this.data,
  });
}

class EmployeeInventoryDataEntity {
  final bool acknowledged;
  final int modifiedCount;
  final String? upsertedId;
  final int upsertedCount;
  final int matchedCount;

  const EmployeeInventoryDataEntity({
    required this.acknowledged,
    required this.modifiedCount,
    required this.upsertedId,
    required this.upsertedCount,
    required this.matchedCount,
  });
}
