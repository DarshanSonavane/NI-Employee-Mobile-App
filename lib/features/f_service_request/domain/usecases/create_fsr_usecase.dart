import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_create_fsr_model.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/send_request_for_create_fsr_repository.dart';

class CreateFSRUsecase implements UseCase<Either, RequestCreateFSRModel> {
  @override
  Future<Either> call({RequestCreateFSRModel? params}) {
    return sl<SendRequestForCreateFSRRepository>().createFSR(params!);
  }
}
