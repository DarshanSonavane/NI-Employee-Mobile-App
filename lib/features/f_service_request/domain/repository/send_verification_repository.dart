import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_send_verification_model.dart';

abstract class SendVerificationRepository {
  Future<Either> sendVerification(RequestSendVerificationModel params);
}
