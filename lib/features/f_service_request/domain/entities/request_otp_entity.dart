class RequestOtpEntity {
  final String customerCode;
  final String otpValue;
  final String otpType;
  RequestOtpEntity(
      {required this.customerCode,
      required this.otpValue,
      required this.otpType});
}
