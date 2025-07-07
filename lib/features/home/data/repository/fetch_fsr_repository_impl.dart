import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/home/data/model/response_fsr_model.dart';

import '../../../../service_locator_dependecies.dart';
import '../../domain/repository/registered_fsr_repository.dart';
import '../model/request_fsr_model.dart';
import '../source/fetch_fsr_list_service.dart';

class FetchFsrRepositoryImpl extends RegisteredFsrRepository {
  @override
  Future<Either<String, ResponseFsrModel>> fetchRegisteredFSR(
      RequestFsrModel params,
      {int? page}) {
    return sl<FetchFsrListService>().fetchFSRList(params, page: page);
  }
}
