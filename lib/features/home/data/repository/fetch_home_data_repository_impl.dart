import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/home/data/source/home_api_service.dart';
import 'package:employee_ni_service/features/home/domain/repository/fetch_home_repository.dart';

import '../../../../service_locator_dependecies.dart';

class FetchDashboardDataRepositoryImpl extends FetchHomeRepository {
  @override
  Future<Either> getHomeDetails() {
    return sl<GetHomeDetailsApiService>().getHomeDetails();
  }
}
