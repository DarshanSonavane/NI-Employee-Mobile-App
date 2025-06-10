import 'package:dartz/dartz.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/fetch_employee_repository.dart';

class FetchEmployeeData extends UseCase<Either, NoParams> {
  @override
  Future<Either> call({NoParams? params}) async {
    return await sl<FetchEmployeeRepository>().getEmployeeDetails();
  }
}
