import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_otp_model.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/send_otp_repository.dart';

class SendOtpUsecase implements UseCase<Either, RequestOtpModel> {
  @override
  Future<Either> call({RequestOtpModel? params}) {
    return sl<SendOTPRepository>().sendOTP(params!);
  }
}
