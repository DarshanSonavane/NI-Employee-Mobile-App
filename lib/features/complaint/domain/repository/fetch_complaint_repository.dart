import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';

abstract class FetchComplaintRepository {
  Future<Either> getComplaintDetails(ParamsAsType? params);
}
