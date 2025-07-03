class LatestRewardEntity {
  final String code;
  final String message;
  final LatestRewardData latestRewardData;
  LatestRewardEntity({
    required this.code,
    required this.message,
    required this.latestRewardData,
  });
}

class LatestRewardData {
  final String id;
  final String employeeId;
  final String key;
  final String description;

  LatestRewardData({
    required this.id,
    required this.employeeId,
    required this.key,
    required this.description,
  });
}
