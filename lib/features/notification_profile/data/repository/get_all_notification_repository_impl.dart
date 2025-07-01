import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/notification_profile/data/source/get_all_notification_service.dart';
import 'package:employee_ni_service/features/notification_profile/domain/repository/get_all_notification_repository.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

class GetAllNotificationRepositoryImpl extends GetAllNotificationRepository {
  @override
  Future<Either> getAllNotification() {
    return sl<GetAllNotificationService>().getAllNotification();
  }
}
