part of 'fetch_notification_bloc.dart';

@immutable
sealed class FetchNotificationState {}

final class FetchNotificationInitial extends FetchNotificationState {}

final class FetchNotificationLoader extends FetchNotificationState {}

final class FetchNotificationSuccess extends FetchNotificationState {
  final ModelAllNotificationResponse modelAllNotificationResponse;
  FetchNotificationSuccess(this.modelAllNotificationResponse);
}

final class FetchNotificationFailure extends FetchNotificationState {
  final String errorMessage;
  FetchNotificationFailure(this.errorMessage);
}
