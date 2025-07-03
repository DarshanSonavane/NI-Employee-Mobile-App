class EntityAllNotificationResponse {
  final String code;
  final String message;
  final List<NotificationData> notificationData;

  EntityAllNotificationResponse(
      {required this.code,
      required this.message,
      required this.notificationData});
}

class NotificationData {
  final String id;
  final String file;
  final String extension;
  final String notes;
  final String createdTime;

  NotificationData({
    required this.id,
    required this.file,
    required this.extension,
    required this.notes,
    required this.createdTime,
  });
}
