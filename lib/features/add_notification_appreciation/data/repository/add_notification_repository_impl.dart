import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_appreciation_request.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_notification_request.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/source/add_notification_service.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/domain/repository/add_notification_repository.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

class AddNotificationRepositoryImpl extends AddNotificationRepository {
  @override
  Future<Either> addNotification(ModelAddNotificationRequest params) {
    return sl<AddNotificationService>().addNotification(params);
  }
}

class AddAppreciationRepositoryImpl extends AddAppreciationRepository {
  @override
  Future<Either> addAppreciation(ModelAddAppreciationRequest params) {
    return sl<AddAppreciationService>().addAppreciation(params);
  }
}
