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
      : message = switch (failure) {
          DioException dio => dio.type == DioExceptionType.connectionError
              ? "No internet connection!"
              : dio.message ?? "Something went wrong!",
          Failure f => f.message,
          String s => s,
          _ => "An unknown error occurred.",
        };
}
