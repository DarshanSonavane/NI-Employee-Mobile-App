import 'package:employee_ni_service/features/set_reset_password/data/model/set_reset_pass_request_params.dart';
import 'package:employee_ni_service/features/set_reset_password/domain/usecase/set_reset_password_usecase.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'set_reset_password_event.dart';
part 'set_reset_password_state.dart';

class SetResetPasswordBloc
    extends Bloc<SetResetPasswordEvent, SetResetPasswordState> {
  SetResetPasswordBloc({
    required SetResetPasswordUsecase setResetPasswordUsecase,
  }) : super(SetResetPasswordInitial()) {
    on<SetResetPasswordEvent>((_, emit) => emit(SetResetPasswordLoading()));
    on<EventSetResetPassword>(_onSetResetPassword);
  }

  void _onSetResetPassword(
    EventSetResetPassword event,
    Emitter<SetResetPasswordState> emit,
  ) async {
    final res = await sl<SetResetPasswordUsecase>().call(
      params: SetResetPassRequestParams(
        customerCode: event.customerCode,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(SetResetPasswordFailure(failure)),
      (user) => emit(SetResetPasswordSuccess()),
    );
  }
}
