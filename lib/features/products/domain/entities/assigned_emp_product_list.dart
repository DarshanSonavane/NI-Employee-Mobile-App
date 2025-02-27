class AssignedEmpProductList {
  final String message;
  final int code;
  final List<EmployeeInventoryEntity> employeeInventory;

  AssignedEmpProductList({
    required this.message,
    required this.code,
    required this.employeeInventory,
  });
}

class EmployeeInventoryEntity {
  final String id;
  final EmployeeEntity employee;
  final ProductEntity product;
  final int assignedQuantity;
  final String createdBy;
  final String? updatedBy;
  final DateTime lastUpdated;
  final DateTime createdAt;
  final DateTime updatedAt;

  EmployeeInventoryEntity({
    required this.id,
    required this.employee,
    required this.product,
    required this.assignedQuantity,
    required this.createdBy,
    this.updatedBy,
    required this.lastUpdated,
    required this.createdAt,
    required this.updatedAt,
  });
}

class EmployeeEntity {
  final String id;
  final String lastName;
  final String firstName;

  EmployeeEntity({
    required this.id,
    required this.lastName,
    required this.firstName,
  });
}

class ProductEntity {
  final String id;
  final String productName;
  final double price;
  final String productCode;

  ProductEntity(
      {required this.id,
      required this.productName,
      required this.price,
      required this.productCode});
}
