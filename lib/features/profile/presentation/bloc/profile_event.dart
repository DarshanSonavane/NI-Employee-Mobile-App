part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class GetEmployeeProfileEvent extends ProfileEvent {
  final String employeeId;
  GetEmployeeProfileEvent({
    required this.employeeId,
  });
}
