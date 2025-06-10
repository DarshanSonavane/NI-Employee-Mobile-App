import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_close_complaint/request_close_complaint_model.dart';

abstract class CloseComplaintRepository {
  Future<Either> closeComplaintItems(
    RequestCloseComplaintModel requestCloseComplaintModel,
    String source,
  );
}
