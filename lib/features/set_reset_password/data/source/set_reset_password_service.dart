import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../model/set_reset_pass_request_params.dart';

abstract class SetResetPasswordService {
  Future<Either> setResetWithCustomerCodeAndPassword(
      SetResetPassRequestParams params);
}

class SetResetPasswordServiceImpl extends SetResetPasswordService {
  @override
  Future<Either> setResetWithCustomerCodeAndPassword(
      SetResetPassRequestParams params) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.updateCustomerPassword, data: params.toMap());

      return Right(response);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
