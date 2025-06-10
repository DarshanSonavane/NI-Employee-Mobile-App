import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

import '../repository/fetch_home_repository.dart';

class FetchHomeData implements UseCase<Either, NoParams> {
  @override
  Future<Either> call({NoParams? params}) async {
    return await sl<FetchHomeRepository>().getHomeDetails();
  }
}
