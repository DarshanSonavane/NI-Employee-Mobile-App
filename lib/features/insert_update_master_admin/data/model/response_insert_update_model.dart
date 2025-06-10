import '../../domain/entities/insert_update_response_entity.dart';

class ResponseInsertUpdateModel extends InsertUpdateResponseEntity {
  ResponseInsertUpdateModel({required super.code, required super.message});

  factory ResponseInsertUpdateModel.fromJson(Map<String, dynamic> json) {
    return ResponseInsertUpdateModel(
      code: json['code'] as int,
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
