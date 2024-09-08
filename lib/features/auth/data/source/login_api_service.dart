import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';

import '../../../../service_locator_dependecies.dart';
import '../models/login_request_params.dart';

abstract class LoginApiService {
  Future<Either> loginWithEmailPassword(LoginRequestParams loginReq);
}

class LoginApiServiceImpl extends LoginApiService {
  @override
  Future<Either> loginWithEmailPassword(LoginRequestParams loginReq) async {
    try {
      var response =
          await sl<DioClient>().post(ApiUrls.login, data: loginReq.toMap());

      return Right(response);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
