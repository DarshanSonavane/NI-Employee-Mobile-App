import 'package:employee_ni_service/features/appreciation_profile/domain/entity/entity_all_appreciation_response.dart';

class ModelAllAppreciationResponse extends EntityAllAppreciationResponse {
  ModelAllAppreciationResponse({
    required super.code,
    required super.message,
    required super.appreciationData,
  });

  factory ModelAllAppreciationResponse.fromJson(Map<String, dynamic> json) {
    return ModelAllAppreciationResponse(
      code: json['code'] as String,
      message: json['message'],
      appreciationData: (json['data'] as List<dynamic>?)
              ?.map((e) => ModelAppreciationData.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class ModelAppreciationData extends AppreciationData {
  ModelAppreciationData({
    required super.id,
    required super.employeeId,
    required super.key,
    required super.description,
    required super.createdTime,
  });

  factory ModelAppreciationData.fromJson(Map<String, dynamic> json) {
    return ModelAppreciationData(
      id: json['_id'] ?? '',
      employeeId: json['employeeId'] ?? '',
      key: json['key'] ?? '',
      description: json['description'] ?? '',
      createdTime: json['createdAt'] ?? '',
    );
  }
}
