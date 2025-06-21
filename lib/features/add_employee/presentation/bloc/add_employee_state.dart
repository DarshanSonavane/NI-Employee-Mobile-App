part of 'add_employee_bloc.dart';

@immutable
sealed class AddEmployeeState {}

final class AddEmployeeInitial extends AddEmployeeState {}

final class AddEmployeeLoading extends AddEmployeeState {}

final class AddEmployeeSuccess extends AddEmployeeState {
  final String message;
  AddEmployeeSuccess({required this.message});
}

final class AddEmployeeFailure extends AddEmployeeState {
  final String error;

  AddEmployeeFailure(failure, {required this.error});
}
