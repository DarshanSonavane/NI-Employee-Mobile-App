import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/f_service_request/data/model/request_create_fsr_model.dart';

abstract class SendRequestForCreateFSRRepository {
  Future<Either> createFSR(RequestCreateFSRModel params);
}
