part of 'set_reset_password_bloc.dart';

@immutable
sealed class SetResetPasswordState {}

final class SetResetPasswordInitial extends SetResetPasswordState {}

final class SetResetPasswordLoading extends SetResetPasswordState {}

final class SetResetPasswordSuccess extends SetResetPasswordState {}

final class SetResetPasswordFailure extends SetResetPasswordState {
  final String message;
  SetResetPasswordFailure(this.message);
}
