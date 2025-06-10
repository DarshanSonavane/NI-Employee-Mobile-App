import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/error/failure.dart';
import 'package:employee_ni_service/features/auth/data/models/login_request_params.dart';
import 'package:employee_ni_service/features/auth/data/models/login_response_params.dart';
import 'package:employee_ni_service/features/auth/domain/usecases/user_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required UserLogin userLogin,
  }) : super(SignInInitial()) {
    on<SignInEvent>((_, emit) => emit(SignInLoading()));
    on<SignInLogin>(_onSignInLogin);
  }

  void _onSignInLogin(
    SignInLogin event,
    Emitter<SignInState> emit,
  ) async {
    final res = await sl<UserLogin>().call(
      params: LoginRequestParams(
        customerCode: event.id,
        type: event.type,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(SignInFailure(failure)),
      (user) => emit(SignInSuccess(user)),
    );
  }
}
