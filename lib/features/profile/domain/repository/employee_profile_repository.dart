import 'package:dartz/dartz.dart';
import '../../data/model/request_employee_profile.dart';

abstract class EmployeeProfileRepository {
  Future<Either> sendEmployeeId(RequestEmployeeProfile params);
}
