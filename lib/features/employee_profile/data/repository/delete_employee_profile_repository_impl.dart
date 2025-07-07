import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/employee_profile/data/source/delete_employee_service.dart';
import 'package:employee_ni_service/features/employee_profile/domain/repository/delete_employee_profile_repository.dart';

import '../../../../service_locator_dependecies.dart';

class DeleteEmployeeProfileRepositoryImpl
    extends DeleteEmployeeProfileRepository {
  @override
  Future<Either> deleteEmployeeProfile(String? value) {
    return sl<DeleteEmployeeService>().deleteEmp(value!);
  }
}
