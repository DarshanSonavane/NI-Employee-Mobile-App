import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';

abstract class FetchCalibrationRepository {
  Future<Either> getCalibrationDetails(ParamsAsType? params);
}
