import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';

import '../../../../service_locator_dependecies.dart';
import '../models/login_request_params.dart';
import '../models/login_response_params.dart';

abstract class LoginApiService {
  Future<Either> loginWithEmailPassword(LoginRequestParams loginReq);
}

class LoginApiServiceImpl extends LoginApiService {
  @override
  Future<Either> loginWithEmailPassword(LoginRequestParams loginReq) async {
    try {
      var response =
          await sl<DioClient>().post(ApiUrls.login, data: loginReq.toMap());
      var loginResponse = LoginResponseParams.fromJson(response.data['data']);
      return Right(loginResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
