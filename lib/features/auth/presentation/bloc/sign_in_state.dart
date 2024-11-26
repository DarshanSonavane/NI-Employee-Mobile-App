part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final LoginResponseParams user;
  SignInSuccess(this.user);
}

final class SignInFailure extends SignInState {
  final String message;

  SignInFailure(dynamic failure)
      : message = failure is DioException
            ? (failure.type == DioExceptionType.connectionError
                ? "No internet connection!"
                : failure.message ?? "Something went wrong!")
            : (failure is String ? failure : "An unknown error occurred.");
}
