import '../../domain/entities/request_send_verfication.dart';

class RequestSendVerificationModel extends EntityRequestVerfication {
  RequestSendVerificationModel(
      {required super.customerCode, required super.otpType});

  factory RequestSendVerificationModel.fromJson(Map<String, dynamic> json) {
    return RequestSendVerificationModel(
        customerCode: json['customerCode'] as String,
        otpType: json['otpType'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'customerCode': customerCode, 'otpType': otpType};
  }
}
