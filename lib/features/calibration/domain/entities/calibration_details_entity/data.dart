import 'customer_id.dart';
import 'employee_id.dart';

class Data {
  String? sId;
  CustomerId? customerId;
  String? machineType;
  EmployeeId? employeeId;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Data({
    required this.sId,
    required this.customerId,
    required this.machineType,
    required this.employeeId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
  });
}
