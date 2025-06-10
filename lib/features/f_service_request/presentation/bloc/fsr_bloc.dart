import 'package:employee_ni_service/features/f_service_request/data/model/request_otp_model.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_send_verification_model.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/response_verification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator_dependecies.dart';
import '../../data/model/request_create_fsr_model.dart';
import '../../domain/usecases/create_fsr_usecase.dart';
import '../../domain/usecases/send_otp_usecase.dart';
import '../../domain/usecases/send_verification_usecase.dart';

part 'fsr_event.dart';
part 'fsr_state.dart';

class FsrBloc extends Bloc<FsrEvent, FsrState> {
  FsrBloc({
    required SendVerificationUsecase sendVerificationCodeUsecase,
    required SendOtpUsecase sendOTPUsecase,
    required CreateFSRUsecase createFsrUsecase,
  }) : super(FsrInitial()) {
    on<FsrEvent>((_, emit) => emit(FsrLoader()));
    on<SendOtpRequest>(_onSendVerificationCode);
    on<VerifyOtp>(_sendOTPVerification);
    on<SendRequestForCreateFSR>(_sendRequestForCreateFSR);
  }

  void _onSendVerificationCode(
    SendOtpRequest event,
    Emitter<FsrState> emit,
  ) async {
    final res = await sl<SendVerificationUsecase>().call(
        params: RequestSendVerificationModel(
            customerCode: event.customerCode, otpType: event.otpType));

    res.fold(
      (failure) => emit(FsrFailure(failure.toString())),
      (success) => emit(
          FsrSuccess<ResponseVerificationModel>(success, "sendVerification")),
    );
  }

  void _sendOTPVerification(
    VerifyOtp event,
    Emitter<FsrState> emit,
  ) async {
    final res = await sl<SendOtpUsecase>().call(
        params: RequestOtpModel(
            customerCode: event.customerCode,
            otpValue: event.otpValue,
            otpType: event.otpType));

    res.fold(
      (failure) => emit(FsrFailure(failure.toString())),
      (success) =>
          emit(FsrSuccess<ResponseVerificationModel>(success, "sendOTP")),
    );
  }

  void _sendRequestForCreateFSR(
    SendRequestForCreateFSR event,
    Emitter<FsrState> emit,
  ) async {
    final res =
        await sl<CreateFSRUsecase>().call(params: event.requestCreateFSRModel);

    res.fold(
      (failure) => emit(FsrFailure(failure.toString())),
      (success) =>
          emit(FsrSuccess<ResponseVerificationModel>(success, "createFSR")),
    );
  }
}
