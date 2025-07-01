import 'package:dartz/dartz.dart';

abstract class GetAllNotificationRepository {
  Future<Either> getAllNotification();
}
