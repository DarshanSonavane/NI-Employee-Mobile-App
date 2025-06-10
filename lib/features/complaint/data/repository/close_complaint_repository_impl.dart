import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_close_complaint/request_close_complaint_model.dart';
import 'package:employee_ni_service/features/complaint/domain/repository/close_complaint_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/close_complaint_item_api_service.dart';

class CloseComplaintRepositoryImpl extends CloseComplaintRepository {
  @override
  Future<Either> closeComplaintItems(
      RequestCloseComplaintModel requestCloseComplaintModel, String source) {
    return sl<CloseComplaintItemApiService>()
        .closeComplaintItem(requestCloseComplaintModel, source);
  }
}
