import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_otp_model.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/response_verification_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class SendOtpService {
  Future<Either> sendOTPRequest(RequestOtpModel params);
}

class SendOtpServiceImpl extends SendOtpService {
  @override
  Future<Either> sendOTPRequest(RequestOtpModel params) async {
    try {
      var response =
          await sl<DioClient>().post(ApiUrls.sendOTP, data: params.toJson());
      var getSendOTPResponse =
          ResponseVerificationModel.fromJson(response.data);
      return Right(getSendOTPResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
