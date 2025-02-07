import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_send_verification_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/send_verification_repository.dart';

class SendVerificationUsecase
    implements UseCase<Either, RequestSendVerificationModel> {
  @override
  Future<Either> call({RequestSendVerificationModel? params}) {
    return sl<SendVerificationRepository>().sendVerification(params!);
  }
}
