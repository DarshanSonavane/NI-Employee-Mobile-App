import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/home/data/model/response_fsr_model.dart';
import 'package:employee_ni_service/features/home/domain/repository/registered_fsr_repository.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../../data/model/request_fsr_model.dart';

class FetchFsrUsecase
    implements UseCase<Either<String, ResponseFsrModel>, RequestFsrModel> {
  @override
  Future<Either<String, ResponseFsrModel>> call(
      {RequestFsrModel? params, int? page}) {
    return sl<RegisteredFsrRepository>()
        .fetchRegisteredFSR(params!, page: page);
  }
}
