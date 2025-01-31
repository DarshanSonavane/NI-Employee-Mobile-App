import 'package:employee_ni_service/features/products/domain/entities/assigned_emp_product_list.dart';

class ResponseAssignedEmployeeProductList extends AssignedEmpProductList {
  ResponseAssignedEmployeeProductList({
    required super.message,
    required super.code,
    required List<EmployeeInventoryModel> super.employeeInventory,
  });

  factory ResponseAssignedEmployeeProductList.fromJson(
      Map<String, dynamic> json) {
    return ResponseAssignedEmployeeProductList(
      message: json['message'],
      code: json['code'],
      employeeInventory: (json['employeeInventory'] as List)
          .map((item) => EmployeeInventoryModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'employeeInventory': employeeInventory
          .map((item) => (item as EmployeeInventoryModel).toJson())
          .toList(),
    };
  }
}

class EmployeeInventoryModel extends EmployeeInventoryEntity {
  EmployeeInventoryModel({
    required super.id,
    required EmployeeModel super.employee,
    required ProductModel super.product,
    required super.assignedQuantity,
    required super.createdBy,
    super.updatedBy,
    required super.lastUpdated,
    required super.createdAt,
    required super.updatedAt,
  });

  factory EmployeeInventoryModel.fromJson(Map<String, dynamic> json) {
    return EmployeeInventoryModel(
      id: json['_id'],
      employee: EmployeeModel.fromJson(json['employeeId']),
      product: ProductModel.fromJson(json['productId']),
      assignedQuantity: json['assignedQuantity'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      lastUpdated: DateTime.parse(json['lastUpdated']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'employeeId': (employee as EmployeeModel).toJson(),
      'productId': (product as ProductModel).toJson(),
      'assignedQuantity': assignedQuantity,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'lastUpdated': lastUpdated.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class EmployeeModel extends EmployeeEntity {
  EmployeeModel({
    required super.id,
    required super.lastName,
    required super.firstName,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['_id'],
      lastName: json['lastName'],
      firstName: json['firstName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'lastName': lastName,
      'firstName': firstName,
    };
  }
}

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.productName,
    required super.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      productName: json['productName'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'productName': productName,
      'price': price,
    };
  }
}
