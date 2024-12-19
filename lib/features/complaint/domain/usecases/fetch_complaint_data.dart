import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';

import '../../../../service_locator_dependecies.dart';
import '../repository/fetch_complaint_repository.dart';

class FetchComplaintData implements UseCase<Either, ParamsAsType> {
  @override
  Future<Either> call({ParamsAsType? params}) async {
    return await sl<FetchComplaintRepository>().getComplaintDetails(params);
  }
}
