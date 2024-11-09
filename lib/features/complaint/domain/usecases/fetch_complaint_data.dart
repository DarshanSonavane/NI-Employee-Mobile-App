import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';

import '../../../../service_locator_dependecies.dart';
import '../repository/fetch_complaint_repository.dart';

class FetchComplaintData implements UseCase<Either, NoParams> {
  @override
  Future<Either> call({NoParams? params}) async {
    return await sl<FetchComplaintRepository>().getComplaintDetails();
  }
}
