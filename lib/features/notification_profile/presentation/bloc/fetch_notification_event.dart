part of 'fetch_notification_bloc.dart';

@immutable
sealed class FetchNotificationEvent {}

class GetAllNotificationEvent extends FetchNotificationEvent {
  GetAllNotificationEvent();
}
