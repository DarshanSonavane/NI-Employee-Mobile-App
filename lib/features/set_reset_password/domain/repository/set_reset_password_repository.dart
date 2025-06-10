import 'package:dartz/dartz.dart';

import '../../data/model/set_reset_pass_request_params.dart';

abstract class SetResetPasswordRepository {
  Future<Either> setResetPasswordCall(SetResetPassRequestParams params);
}
