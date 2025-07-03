import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/home/data/model/response_fsr_model.dart';

import '../../data/model/request_fsr_model.dart';

abstract class RegisteredFsrRepository {
  Future<Either<String, ResponseFsrModel>> fetchRegisteredFSR(
      RequestFsrModel params,
      {int? page});
}
