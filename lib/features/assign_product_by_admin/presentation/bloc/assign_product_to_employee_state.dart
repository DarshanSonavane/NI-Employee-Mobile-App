part of 'assign_product_to_employee_bloc.dart';

@immutable
sealed class AssignProductToEmployeeState {}

final class AssignProductToEmployeeInitial
    extends AssignProductToEmployeeState {}

final class AssignProductToEmployeeLoading
    extends AssignProductToEmployeeState {}

final class AssignProductToEmployeeSuccess<T>
    extends AssignProductToEmployeeState {
  final T data;
  AssignProductToEmployeeSuccess(this.data);
}

final class AssignProductToEmployeeFailure
    extends AssignProductToEmployeeState {
  final String message;

  AssignProductToEmployeeFailure(this.message);
}
