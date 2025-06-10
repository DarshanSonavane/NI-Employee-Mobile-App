part of 'fsr_bloc.dart';

@immutable
sealed class FsrEvent {}

final class SendOtpRequest extends FsrEvent {
  final String customerCode;
  final String otpType;
  SendOtpRequest({
    required this.customerCode,
    required this.otpType,
  });
}

final class VerifyOtp extends FsrEvent {
  final String customerCode;
  final String otpValue;
  final String otpType;
  VerifyOtp(
      {required this.customerCode,
      required this.otpValue,
      required this.otpType});
}

final class SendRequestForCreateFSR extends FsrEvent {
  final RequestCreateFSRModel requestCreateFSRModel;
  SendRequestForCreateFSR({
    required this.requestCreateFSRModel,
  });
}
