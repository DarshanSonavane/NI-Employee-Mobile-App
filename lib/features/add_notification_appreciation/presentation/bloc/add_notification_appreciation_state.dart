part of 'add_notification_appreciation_bloc.dart';

@immutable
sealed class AddNotificationAppreciationState {}

final class AddNotificationAppreciationInitial
    extends AddNotificationAppreciationState {}

final class AddNotificationAppreciationLoading
    extends AddNotificationAppreciationState {}

final class AddNotificationAppreciationSuccess
    extends AddNotificationAppreciationState {
  final ModelAddNotificationResponse modelAddNotificationResponse;
  AddNotificationAppreciationSuccess(this.modelAddNotificationResponse);
}

final class AddNotificationAppreciationFailure
    extends AddNotificationAppreciationState {
  final String error;
  AddNotificationAppreciationFailure(this.error);
}
