import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_send_verification_model.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/response_verification_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class SendVerificationService {
  Future<Either> sendVerificationRequest(RequestSendVerificationModel params);
}

class SendVerificationServiceImpl extends SendVerificationService {
  @override
  Future<Either> sendVerificationRequest(
      RequestSendVerificationModel params) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.sendVerificationCode, data: params.toJson());
      var getVerificationResponse =
          ResponseVerificationModel.fromJson(response.data);
      return Right(getVerificationResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
