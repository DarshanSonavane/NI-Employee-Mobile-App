class ResponseUpdatePasswordModel {
  final String? code;
  final String? message;

  ResponseUpdatePasswordModel({this.code, this.message});

  factory ResponseUpdatePasswordModel.fromJson(Map<String, dynamic> json) {
    return ResponseUpdatePasswordModel(
      code: json['code']?.toString(),
      message: json['message']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
    };
  }
}
