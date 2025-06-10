import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_send_verification_model.dart';
import 'package:employee_ni_service/features/f_service_request/domain/repository/send_verification_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/send_verification_service.dart';

class SendVerificationRepositoryImpl extends SendVerificationRepository {
  @override
  Future<Either> sendVerification(RequestSendVerificationModel params) {
    return sl<SendVerificationService>().sendVerificationRequest(params);
  }
}
