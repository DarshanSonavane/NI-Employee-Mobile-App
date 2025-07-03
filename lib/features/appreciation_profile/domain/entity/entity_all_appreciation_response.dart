class EntityAllAppreciationResponse {
  final String code;
  final String message;
  final List<AppreciationData> appreciationData;

  EntityAllAppreciationResponse(
      {required this.code,
      required this.message,
      required this.appreciationData});
}

class AppreciationData {
  final String id;
  final String employeeId;
  final String key;
  final String description;
  final String createdTime;

  AppreciationData({
    required this.id,
    required this.employeeId,
    required this.key,
    required this.description,
    required this.createdTime,
  });
}
