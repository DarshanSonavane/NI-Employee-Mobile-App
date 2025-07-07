import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_appreciation_request.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_notification_request.dart';

abstract class AddNotificationRepository {
  Future<Either> addNotification(ModelAddNotificationRequest params);
}

abstract class AddAppreciationRepository {
  Future<Either> addAppreciation(ModelAddAppreciationRequest params);
}
