import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/home/domain/repository/registered_fsr_repository.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../../data/model/request_fsr_model.dart';

class FetchFsrUsecase implements UseCase<Either, RequestFsrModel> {
  @override
  Future<Either> call({RequestFsrModel? params}) {
    return sl<RegisteredFsrRepository>().fetchRegisteredFSR(params!);
  }
}
