// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_notification_appreciation_bloc.dart';

@immutable
sealed class AddNotificationAppreciationEvent {}

class AddAppreciationEvent extends AddNotificationAppreciationEvent {
  final String key;
  final String empId;
  final String description;
  AddAppreciationEvent({
    required this.key,
    required this.empId,
    required this.description,
  });
}

class AddNotificationEvent extends AddNotificationAppreciationEvent {
  final String message;
  final String? base64File;
  final String? fileExtension;
  AddNotificationEvent({
    required this.message,
    this.base64File,
    this.fileExtension,
  });
}
