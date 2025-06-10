import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/profile/data/model/request_employee_profile.dart';
import 'package:employee_ni_service/features/profile/domain/repository/employee_profile_repository.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

import '../source/employee_profile_details_service.dart';

class EmployeeProfileRepositoryImpl extends EmployeeProfileRepository {
  @override
  Future<Either> sendEmployeeId(RequestEmployeeProfile params) {
    return sl<EmployeeProfileDetailsService>().sendEmployeeId(params);
  }
}
