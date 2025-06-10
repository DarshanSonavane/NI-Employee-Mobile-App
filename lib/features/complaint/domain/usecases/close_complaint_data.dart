import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_close_complaint/request_close_complaint_model.dart';
import 'package:employee_ni_service/features/complaint/domain/repository/close_complaint_repository.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';

class CloseComplaintData extends UseCase<Either, RequestCloseComplaintModel> {
  @override
  Future<Either> call(
      {RequestCloseComplaintModel? params, String? source}) async {
    return await sl<CloseComplaintRepository>()
        .closeComplaintItems(params!, source!);
  }
}
