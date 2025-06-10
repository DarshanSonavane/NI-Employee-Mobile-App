import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_otp_model.dart';
import 'package:employee_ni_service/features/f_service_request/data/source/send_otp_service.dart';
import 'package:employee_ni_service/features/f_service_request/domain/repository/send_otp_repository.dart';

import '../../../../service_locator_dependecies.dart';

class SendOTPRepositoryImpl extends SendOTPRepository {
  @override
  Future<Either> sendOTP(RequestOtpModel params) {
    return sl<SendOtpService>().sendOTPRequest(params);
  }
}
