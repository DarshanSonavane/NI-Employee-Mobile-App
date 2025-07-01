import 'package:employee_ni_service/features/home/domain/entities/latest_reward_entity.dart';

class ResponseLatestRewardModel extends LatestRewardEntity {
  ResponseLatestRewardModel({
    required super.code,
    required super.message,
    required super.latestRewardData,
  });

  factory ResponseLatestRewardModel.fromJson(Map<String, dynamic> json) {
    return ResponseLatestRewardModel(
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      latestRewardData: ModelLatestRewardData.fromJson(
        (json['data'] ?? <String, dynamic>{}) as Map<String, dynamic>,
      ),
    );
  }
}

class ModelLatestRewardData extends LatestRewardData {
  ModelLatestRewardData({
    required super.id,
    required super.employeeId,
    required super.key,
    required super.description,
  });

  factory ModelLatestRewardData.fromJson(Map<String, dynamic> json) {
    return ModelLatestRewardData(
      id: json['_id'] ?? '',
      employeeId: json['employeeId'] ?? '',
      key: json['key'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
