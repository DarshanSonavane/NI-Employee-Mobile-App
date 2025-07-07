part of 'employee_profile_bloc.dart';

@immutable
sealed class EmployeeProfileEvent {}

class DeleteEmployeeEvent extends EmployeeProfileEvent {
  final String employeeId;

  DeleteEmployeeEvent({required this.employeeId});
}
