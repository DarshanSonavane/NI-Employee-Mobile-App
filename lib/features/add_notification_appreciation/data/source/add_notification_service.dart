import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_appreciation_request.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_notification_request.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/data/model/model_add_notification_response.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

abstract class AddNotificationService {
  Future<Either> addNotification(ModelAddNotificationRequest params);
}

abstract class AddAppreciationService {
  Future<Either> addAppreciation(ModelAddAppreciationRequest params);
}

class AddNotificationServiceImpl implements AddNotificationService {
  @override
  Future<Either<DioException, ModelAddNotificationResponse>> addNotification(
      ModelAddNotificationRequest params) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.saveNotification, data: params.toJson());
      var responseAddNotification =
          ModelAddNotificationResponse.fromJson(response.data);
      return Right(responseAddNotification);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}

class AddAppreciationServiceImpl implements AddAppreciationService {
  @override
  Future<Either<DioException, ModelAddNotificationResponse>> addAppreciation(
      ModelAddAppreciationRequest params) async {
    try {
      var response =
          await sl<DioClient>().post(ApiUrls.saveReward, data: params.toJson());
      var responseAddAppreciation =
          ModelAddNotificationResponse.fromJson(response.data);
      return Right(responseAddAppreciation);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
