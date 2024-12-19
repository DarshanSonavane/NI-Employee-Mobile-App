import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/database/hive_storage_service.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../models/model_complaint_list/response_complaint_details.dart';

abstract class GetComplaintDetailApiService {
  Future<Either> getComplaintDetails(ParamsAsType? params);
}

class GetComplaintDetailsApiServiceImpl extends GetComplaintDetailApiService {
  final hiveStorageService = sl<HiveStorageService>();

  @override
  Future<Either> getComplaintDetails(ParamsAsType? params) async {
    final hiveUser = hiveStorageService.getUser();
    final apiUrl = params?.typeOfData == Constants.activeComplaints
        ? ApiUrls.getActiveComplaintDetails
        : ApiUrls.getClosedComplaintDetails;

    final queryParams = (hiveUser?.role != '0' && hiveUser?.id != null)
        ? {
            Constants.employeeId: hiveUser!.id,
          }
        : null;
    try {
      var response =
          await sl<DioClient>().get(apiUrl, queryParameters: queryParams);
      var getComplaintDetailsResponse =
          ResponseComplaintDetails.fromJson(response.data);
      return Right(getComplaintDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
