import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_otp_model.dart';

abstract class SendOTPRepository {
  Future<Either> sendOTP(RequestOtpModel params);
}
