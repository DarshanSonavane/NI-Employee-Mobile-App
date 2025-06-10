import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_create_fsr_model.dart';
import 'package:employee_ni_service/features/f_service_request/domain/repository/send_request_for_create_fsr_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/create_fsr_service.dart';

class CreateFsrRepositoryImpl extends SendRequestForCreateFSRRepository {
  @override
  Future<Either> createFSR(RequestCreateFSRModel params) {
    return sl<CreateFSRService>().createFSRRequest(params);
  }
}
