import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/add_customer/domain/repository/fetch_states_repository.dart';

import '../../../../service_locator_dependecies.dart';

class FetchStatesUsecase extends UseCase<Either, NoParams> {
  @override
  Future<Either> call({NoParams? params}) async {
    return await sl<FetchStatesRepository>().fetchStates();
  }
}
