import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/complaint/data/source/get_complaint_detail_api_service.dart';
import 'package:employee_ni_service/features/complaint/domain/repository/fetch_complaint_repository.dart';

import '../../../../service_locator_dependecies.dart';

class FetchComplaintRepositoryImpl extends FetchComplaintRepository {
  @override
  Future<Either> getComplaintDetails() {
    return sl<GetComplaintDetailApiService>().getComplaintDetails();
  }
}
