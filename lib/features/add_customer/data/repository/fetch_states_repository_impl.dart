import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/add_customer/data/source/fetch_states_service.dart';
import 'package:employee_ni_service/features/add_customer/domain/repository/fetch_states_repository.dart';

import '../../../../service_locator_dependecies.dart';

class FetchStatesRepositoryImpl extends FetchStatesRepository {
  @override
  Future<Either> fetchStates() {
    return sl<FetchStatesService>().fetchStates();
  }
}
