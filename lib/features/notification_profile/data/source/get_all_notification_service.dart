import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/notification_profile/data/model/model_all_notification_response.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

abstract class GetAllNotificationService {
  Future<Either> getAllNotification();
}

class GetAllNotificationServiceImpl extends GetAllNotificationService {
  @override
  Future<Either<DioException, ModelAllNotificationResponse>>
      getAllNotification() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.fetchNotification);
      var responseNotificationList =
          ModelAllNotificationResponse.fromJson(response.data);
      return Right(responseNotificationList);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
