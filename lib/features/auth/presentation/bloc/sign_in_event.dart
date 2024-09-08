part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

final class SignInLogin extends SignInEvent {
  final String id;
  final String type;
  final String password;

  SignInLogin({
    required this.id,
    required this.type,
    required this.password,
  });
}
