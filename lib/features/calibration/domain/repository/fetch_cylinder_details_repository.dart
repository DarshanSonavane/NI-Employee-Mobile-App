import 'package:dartz/dartz.dart';

abstract class FetchCylinderDetailsRepository {
  Future<Either> getCylinderDetails();
}
