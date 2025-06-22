import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_delete_customer_request.dart';
import 'package:employee_ni_service/features/customer_profile/domain/repository/delete_customer_profile_repository.dart';

import '../../../../service_locator_dependecies.dart';

class DeleteCustomerUsecase
    extends UseCase<Either, ModelDeleteCustomerRequest> {
  @override
  Future<Either> call({ModelDeleteCustomerRequest? params}) async {
    return await sl<DeleteCustomerProfileRepository>()
        .deleteCustomerProfile(params!);
  }
}
