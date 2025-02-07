import 'package:employee_ni_service/features/f_service_request/domain/entities/request_otp_entity.dart';

class RequestOtpModel extends RequestOtpEntity {
  RequestOtpModel(
      {required super.customerCode,
      required super.otpValue,
      required super.otpType});

  factory RequestOtpModel.fromJson(Map<String, dynamic> json) {
    return RequestOtpModel(
        customerCode: json['customerCode'] as String,
        otpValue: json['otp'] as String,
        otpType: json['otpType'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'customerCode': customerCode,
      'otp': otpValue,
      'otpType': otpType,
    };
  }
}
