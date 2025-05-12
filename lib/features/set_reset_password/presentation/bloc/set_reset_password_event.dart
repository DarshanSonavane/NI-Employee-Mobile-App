part of 'set_reset_password_bloc.dart';

@immutable
sealed class SetResetPasswordEvent {}

final class EventSetResetPassword extends SetResetPasswordEvent {
  final String employeeCode;
  final String password;

  EventSetResetPassword({
    required this.employeeCode,
    required this.password,
  });
}
