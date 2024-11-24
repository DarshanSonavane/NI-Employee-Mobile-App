import 'package:dartz/dartz.dart';

abstract class FetchEmployeeRepository {
  Future<Either> getEmployeeDetails();
}
