class EntityAddNotification {
  final String message;
  final String? base64File;
  final String? fileExtension;
  EntityAddNotification({
    required this.message,
    this.base64File,
    this.fileExtension,
  });
}
