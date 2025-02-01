part of 'assign_product_to_employee_bloc.dart';

@immutable
sealed class AssignProductToEmployeeEvent {}

final class GetAllMasterInventory extends AssignProductToEmployeeEvent {}

final class GetAllEmployeesList extends AssignProductToEmployeeEvent {
  GetAllEmployeesList();
}

final class AssignProductToEmployee extends AssignProductToEmployeeEvent {
  final ProductAssignmentModel productAssignment;
  AssignProductToEmployee(this.productAssignment);
}
