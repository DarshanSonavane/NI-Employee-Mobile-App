import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/set_reset_password/domain/repository/set_reset_password_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../../data/model/set_reset_pass_request_params.dart';

class SetResetPasswordUsecase
    implements UseCase<Either, SetResetPassRequestParams> {
  @override
  Future<Either> call({SetResetPassRequestParams? params}) async {
    return sl<SetResetPasswordRepository>().setResetPasswordCall(params!);
  }
}
