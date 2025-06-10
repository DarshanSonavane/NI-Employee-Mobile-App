import '../../domain/entities/response_verification_entity.dart';

class ResponseVerificationModel extends ResponseVerificationEntity {
  ResponseVerificationModel({required super.code, required super.message});

  factory ResponseVerificationModel.fromJson(Map<String, dynamic> json) {
    return ResponseVerificationModel(
      code: json['code'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
    };
  }
}
