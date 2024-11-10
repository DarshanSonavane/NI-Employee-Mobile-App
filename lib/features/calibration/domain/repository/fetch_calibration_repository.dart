import 'package:dartz/dartz.dart';

abstract class FetchCalibrationRepository {
  Future<Either> getCalibrationDetails();
}
