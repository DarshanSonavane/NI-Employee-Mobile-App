import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/set_reset_password/data/source/set_reset_password_service.dart';
import 'package:employee_ni_service/features/set_reset_password/domain/repository/set_reset_password_repository.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

import '../model/set_reset_pass_request_params.dart';

class SetResetPasswordRepositoryImpl extends SetResetPasswordRepository {
  @override
  Future<Either> setResetPasswordCall(SetResetPassRequestParams params) {
    return sl<SetResetPasswordService>()
        .setResetWithCustomerCodeAndPassword(params);
  }
}
