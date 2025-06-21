import 'package:dartz/dartz.dart';

abstract class DeleteEmployeeProfileRepository {
  Future<Either> deleteEmployeeProfile(String? value);
}
