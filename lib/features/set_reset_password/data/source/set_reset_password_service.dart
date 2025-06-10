import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/set_reset_password/data/model/set_reset_password_response.dart';

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

      var updatedPasswordResponse =
          ResponseUpdatePasswordModel.fromJson(response.data);
      return Right(updatedPasswordResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
