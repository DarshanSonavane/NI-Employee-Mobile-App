part of 'employee_profile_bloc.dart';

@immutable
sealed class EmployeeProfileState {}

final class EmployeeProfileInitial extends EmployeeProfileState {}

final class EmployeeProfileLoading extends EmployeeProfileState {}

final class EmployeeProfileSuccess extends EmployeeProfileState {
  final String message;
  EmployeeProfileSuccess({required this.message});
}

final class EmployeeProfileFailure extends EmployeeProfileState {
  final String error;
  EmployeeProfileFailure({required this.error});
}
